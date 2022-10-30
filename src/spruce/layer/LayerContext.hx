package spruce.layer;

import pine.*;
import spruce.animation.Keyframe;

typedef LayerContextProvider = Provider<LayerContext>;

enum LayerContextStatus {
  Showing;
  Hiding;
}

@:allow(spruce.layer)
class LayerContext implements Record {
  public static function from(context:Context) {
    return LayerContextProvider.from(context);
  }
  
  @prop public final showAnimation:(context:Context) -> Array<Keyframe>;
  @prop public final hideAnimation:(context:Context) -> Array<Keyframe>;
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
