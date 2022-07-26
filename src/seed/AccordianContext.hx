package seed;

import pine.*;

typedef AccordianContextProvider = Provider<AccordianContext>; 

class AccordianContext implements Disposable {
  public static function from(context:Context) {
    return AccordianContextProvider.from(context);
  }

  final contexts:Array<AccordianCollapseContext> = [];
  final sticky:State<Bool>;

  public var isSticky(get, never):Bool;
  inline function get_isSticky() {
    return sticky.get();
  }

  public function new(sticky) {
    this.sticky = new State(sticky);
  }

  public function createCollapseContext() {
    var context = new AccordianCollapseContext(this);
    contexts.push(context);
    return context;
  }

  public function show(current:AccordianCollapseContext) {
    if (isSticky) {
      current.show();
    } else for (context in contexts) if (context == current) {
      context.show();
    } else {
      context.hide();
    }
  }

  public function hide(current:AccordianCollapseContext) {
    if (isSticky) {
      current.hide();
    } else for (context in contexts) context.hide();
  }

  public function toggleSticky() {
    sticky.set(!sticky.peek());
  }

  public function makeSticky() {
    sticky.set(true);
  }

  public function makeNotSticky() {
    sticky.set(false);
  }

  public function showAll() {
    for (context in contexts) context.show();
  }

  public function hideAll() {
    for (context in contexts) context.hide();
  }

  public function dispose() {
    for (context in contexts) context.dispose();
    contexts.resize(0);
  }
}
