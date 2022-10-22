package seed2.focus;

import pine.*;
import pine.Portal;

class EscapableFocus extends Component {
  public static final type = new UniqueId();

  public final child:Component;
  public final onLoseFocus:()->Void;

  public function new(props:{
    child:Component,
    onLoseFocus:()->Void,
    ?key:Key
  }) {
    super(props.key);
    this.onLoseFocus = props.onLoseFocus;
    this.child = props.child;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new EscapableFocusElement(this);
  }
}

class EscapableFocusElement extends Element {
  var child:Null<Element>;
  var escapable(get, never):EscapableFocus;
  inline function get_escapable():EscapableFocus return getComponent();

  public function new(escapable:EscapableFocus) {
    super(escapable);
  }

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, escapable.child, slot);
    giveFocusAndSetupListeners();
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, escapable.child, slot);
    giveFocusAndSetupListeners();
  }

  function performDispose() {
    #if (js && !nodejs)
    js.Browser.window.removeEventListener('click', triggerLoseFocus);
    #end
  }
  
  function giveFocusAndSetupListeners() {
    #if (js && !nodejs)
    if (!isRegistered) {
      isRegistered = true;
      
      js.Browser.window.addEventListener('click', triggerLoseFocus);

      var el:js.html.Element = Portal.getObjectMaybeInPortal(this);
      el.focus();
    }
    #end
  }

  #if (js && !nodejs)
  var isRegistered:Bool = false;

  function triggerLoseFocus(e:js.html.Event) { 
    escapable.onLoseFocus();
  }
  #end

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }
}