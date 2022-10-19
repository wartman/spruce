package seed2.layer;

import pine.*;
import seed2.animation.TransitionGroup;

enum LayerContextStatus {
  Showing;
  Hiding;
}

@:allow(seed2.layer)
class LayerContext implements Record {
  public static function from(context:Context) {
    return LayerContextProvider.from(context);
  }
  
  @prop public final showTransition:TransitionGroup;
  @prop public final hideTransition:TransitionGroup;
  @prop public final transitionSpeed:Int;
  @prop public final onShow:()->Void = null;
  @prop public final onHide:()->Void = null;
  @track public var status:LayerContextStatus = Showing;

  public function hide():Void {
    status = Hiding;
  }
  
  public function show():Void {
    status = Showing;
  }
}
