package spruce.dropdown;

import spruce.focus.FocusContext;
import haxe.ds.Option;
import pine.*;
import pine.Portal;

using pine.Cast;

class DropdownContainer extends Component {
  final type = new UniqueId();
  
  public final child:Component;
  public final onHide:()->Void;
  
  public function new(props:{
    child:Component,
    onHide:()->Void,
    ?key:Key
  }) {
    super(props.key);
    this.onHide = props.onHide;
    this.child = props.child;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new DropdownContainerElement(this);
  }
}

class DropdownContainerElement extends Element {
  var child:Null<Element>;
  var container(get, never):DropdownContainer;
  inline function get_container():DropdownContainer return getComponent();

  public function new(container:DropdownContainer) {
    super(container);
  }

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, container.child, slot);
    giveFocusAndSetupListeners(); 
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, container.child, slot);
    if (previousComponent == null) giveFocusAndSetupListeners(); 
  }

  function performDispose() {
    #if (js && !nodejs)
    var el = getPossiblePortalElement();

    el.ownerDocument.removeEventListener('click', hide);
    el.ownerDocument.removeEventListener('keypress', onKeyPress);

    FocusContext.from(this).returnFocus();
    #end
  }

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }

  function giveFocusAndSetupListeners() {
    #if (js && !nodejs)
    var el = getPossiblePortalElement();

    el.ownerDocument.addEventListener('click', hide);
    el.ownerDocument.addEventListener('keydown', onKeyPress);

    maybeFocusFirst();
    #end
  }

  #if (js && !nodejs)
  function hide(e:js.html.Event) { 
    e.stopPropagation();
    e.preventDefault();
    container.onHide();
  }

  function onKeyPress(event:js.html.KeyboardEvent) {
    switch event.key {
      case 'Escape': 
        hide(event);
      case 'ArrowUp':
        focusPrevious(event);
      case 'ArrowDown':
        focusNext(event);
      default:
    }
  }

  inline function getPossiblePortalElement() {
    var el:js.html.Element = Portal.getObjectMaybeInPortal(this);
    return el;
  }

  function maybeFocusFirst() {
    switch getNextFocusedChild(1) {
      case Some(item): 
        var el = item.getObject().as(js.html.Element);
        FocusContext.from(this).focus(el);
      case None:
    }
  }

  function focusNext(e:js.html.KeyboardEvent) {
    e.preventDefault();
    switch getNextFocusedChild(1) {
      case Some(item): 
        item.getObject().as(js.html.Element).focus();
      case None:
    }
  }

  function focusPrevious(e:js.html.KeyboardEvent) {
    e.preventDefault();
    switch getNextFocusedChild(-1) {
      case Some(item): 
        item.getObject().as(js.html.Element).focus();
      case None:
    }
  }

  var current:Null<Element> = null;

  function getNextFocusedChild(offset:Int):Option<Element> {
    switch getMenu() {
      case Some(menu): switch menu.queryChildren(child -> {
        return child.getComponent().getComponentType() == DropdownMenuLink.componentType;
      }) {
        case Some(items):
          var index = items.indexOf(current) + offset;
          index = Math.ceil(Math.max(0, Math.min(index, items.length)));
          var item = items[index];
          if (item != null) {
            current = item;
            return Some(current);
          }
        case None:
      }
      case None:
    }

    return None;
  }

  // @todo:
  // The way Portals work breaks a lot of stuff, as `visitChildren` will
  // return their placeholder children, not the actual content. We 
  // should consider a way to change this so we don't need wacky
  // stuff like the following method.
  function getMenu():Option<Element> {
    var query = (target:Element) -> target
      .queryFirstChild(el -> el.getComponent().getComponentType() == DropdownMenu.componentType);
    
    return switch queryFirstChild(child -> child is PortalElement) {
      case Some(portal): switch portal.as(PortalElement).getPortalRoot() {
        case Some(el): query(el);
        default: query(this);
      }
      default:
        query(this);
    }
  }
  #end
}
