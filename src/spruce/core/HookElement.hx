package spruce.core;

import pine.*;

// @todo: Rework this to use the new @component meta?
abstract class HookElement<T:HookComponent> extends Element {
  var child:Null<Element> = null;
  var hook(get, never):T;
  function get_hook():T return getComponent();

  public function new(hook:T) {
    super(hook);
  }

  abstract function onUpdate(previousComponent:Null<Component>):Void;

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, hook.getChild(), slot);
    onUpdate(null);
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, hook.getChild(), slot);
    onUpdate(previousComponent);
  }

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }
}
