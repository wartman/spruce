package seed;

import pine.*;
import seed.animation.AnimationContext;

typedef AccordianContextProvider = Provider<AccordianContext>; 

class AccordianContext implements Disposable {
  public static function from(context:Context) {
    return AccordianContextProvider.from(context);
  }

  final contexts:Array<AccordianCollapseContext> = [];
  final animation:AnimationContext;
  final speed:Int;
  final sticky:State<Bool>;

  public var isSticky(get, never):Bool;
  inline function get_isSticky() {
    return sticky.get();
  }

  public function new(props) {
    this.sticky = new State(props.sticky);
    this.animation = props.animation;
    this.speed = props.speed;
  }

  public function createCollapseContext() {
    var context = new AccordianCollapseContext({
      accordian: this,
      animation: animation,
      speed: speed,
      collapsed: true
    });
    contexts.push(context);
    return context;
  }

  public function show(current:AccordianCollapseContext) {
    if (isSticky) {
      current.show();
    } else {
      for (context in contexts) if (context == current) {
        context.show();
      } else {
        context.hide();
      }
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
