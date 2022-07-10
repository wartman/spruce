package seed;

import pine.*;

typedef AccordianContextProvider = Provider<AccordianContext>; 

class AccordianContext implements Disposable {
  public static function from(context:Context) {
    return AccordianContextProvider.from(context);
  }

  final contexts:Array<AccordianCollapseContext> = [];

  public function new() {}

  public function createCollapseContext() {
    var context = new AccordianCollapseContext(this);
    contexts.push(context);
    return context;
  }

  public function show(current:AccordianCollapseContext) {
    for (context in contexts) if (context == current) {
      context.show();
    } else {
      context.hide();
    }
  }

  public function hide() {
    for (context in contexts) context.hide();
  }

  public function dispose() {
    for (context in contexts) context.dispose();
    contexts.resize(0);
  }
}
