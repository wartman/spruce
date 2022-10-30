package spruce.layer;

import pine.*;
import spruce.focus.FocusContext;

using Nuke;

class LayerContainer extends Component {
  static final type = new UniqueId();

  public final child:Component;
  public final hideOnEscape:Bool;

  public function new(props) {
    super(null);
    this.child = props.child;
    this.hideOnEscape = props.hideOnEscape;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new LayerContainerElement(this);
  }
}

class LayerContainerElement extends Element {
  var child:Null<Element> = null;
  var container(get, never):LayerContainer;
  inline function get_container():LayerContainer return getComponent();

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, container.child, slot);
    giveFocusAndSetupListeners();
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, container.child, slot);
    if (previousComponent == null) giveFocusAndSetupListeners();
  }

  function giveFocusAndSetupListeners() {
    #if (js && !nodejs)
    var el = getPossiblePortalElement();
    el.ownerDocument.addEventListener('keydown', onKeyPress);
    FocusContext.from(this).focus(el);
    #end
  }

  function performDispose() {
    #if (js && !nodejs)
    var el = getPossiblePortalElement();
    el.ownerDocument.removeEventListener('keydown', onKeyPress);
    FocusContext.from(this).returnFocus();
    #end
  }

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }

  #if (js && !nodejs)
  inline function getPossiblePortalElement() {
    var el:js.html.Element = Portal.getObjectMaybeInPortal(this);
    return el;
  }

  function hide(e:js.html.Event) { 
    e.preventDefault();
    LayerContext.from(this).hide();
  }

  function onKeyPress(event:js.html.KeyboardEvent) {
    switch event.key {
      case 'Escape' if (container.hideOnEscape): hide(event);
      default:
    }
  }
  #end
}
