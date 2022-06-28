package seed;

import pine.*;

typedef CollapseContextProvider = Provider<CollapseContext>;

class CollapseContext implements Disposable {
  public static function from(context:Context) {
    return CollapseContextProvider.from(context);
  }

  public function new() {}

  public function dispose() {
    // todo
  }
}
