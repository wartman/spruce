package seed;

import pine.*;

typedef OverlayContextProvider = Provider<OverlayContext>; 

abstract class OverlayContext implements Disposable {
  public static function from(context:Context) {
    return OverlayContextProvider.from(context);
  }

  abstract public function hide():Void;
  
  abstract public function show():Void;
}
