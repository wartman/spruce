package seed;

import pine.*;

typedef OverlayContextProvider = Provider<OverlayContext>; 

typedef OverlayContextProps = {
  ?beforeShow:()->Void,
  ?onShow:()->Void,
  ?onHide:()->Void
}; 

// todo: We might consider renaming all the `Overlay` stuff to something 
// like `Layer`?
abstract class OverlayContext implements Disposable {
  public static function from(context:Context) {
    return OverlayContextProvider.from(context);
  }
  
  final props:OverlayContextProps;

  public function new(props) {
    this.props = props;
  }

  abstract public function activate(getEl:()->Dynamic):Void;

  abstract public function hide():Void;
  
  abstract public function show():Void;
}
