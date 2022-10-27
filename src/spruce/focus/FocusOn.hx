package spruce.focus;

import pine.*;

// @todo: Make this robust. It should return focus to the
// previous item, etc. 
//
// Or just work. I don't think this works yet.

class FocusOn extends Component {
  public static final type = new UniqueId();

  public final child:Component;

  public function new(props:{
    child:Component,
    ?key:Key
  }) {
    super(props.key);
    child = props.child;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new FocusOnElement(this);
  }
}

class FocusOnElement extends Element {
  var child:Null<Element>;
  var focusable(get, never):FocusOn;
  inline function get_focusable():FocusOn return getComponent();

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, focusable.child, slot);
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, focusable.child, slot);
    #if (js && !nodejs)
    Process.from(this).defer(() -> {
      var el:js.html.Element = Portal.getObjectMaybeInPortal(this);
      el.focus();
      trace(el);
    });
    #end
  }

  function performDispose() {}

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }
}
