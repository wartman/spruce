package spruce.dropdown;

import haxe.ds.Option;
import pine.*;
import pine.Portal;
import spruce.core.*;
import spruce.focus.FocusContext;

using pine.Cast;

class DropdownContainer extends HookComponent {
  @prop public final onHide:()->Void;

  public function createElement():Element {
    return new DropdownContainerElement(this);
  }
}

class DropdownContainerElement extends HookElement<DropdownContainer> {

  function onUpdate(previousComponent:Null<Component>) {
    #if (js && !nodejs)
    if (previousComponent != null) return;

    var el = getPossiblePortalElement();

    el.ownerDocument.addEventListener('click', hide);
    el.ownerDocument.addEventListener('keydown', onKeyPress);

    maybeFocusFirst();
    #end
  }

  function performDispose() {
    #if (js && !nodejs)
    var el = getPossiblePortalElement();

    el.ownerDocument.removeEventListener('click', hide);
    el.ownerDocument.removeEventListener('keypress', onKeyPress);

    FocusContext.from(this).returnFocus();
    #end
  }

  #if (js && !nodejs)
  function hide(e:js.html.Event) { 
    e.stopPropagation();
    e.preventDefault();
    hook.onHide();
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
