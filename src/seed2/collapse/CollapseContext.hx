package seed2.collapse;

import pine.*;

typedef CollapseContextProvider = Provider<CollapseContext>;

class CollapseContext implements Record {
  public static function from(context:Context) {
    return switch CollapseContextProvider.maybeFrom(context) {
      case Some(collapse): collapse;
      case None: throw 'No collapse context was found';
    }
  }

  @track public var status:CollapseStatus;
  @prop public final duration:Int = 200;

  public function toggle() {
    switch status {
      case Expanded: collapse();
      case Collapsed: expand();
    }
  }

  public function expand() {
    status = Expanded;
  }

  public function collapse() {
    status = Collapsed;
  }
}
