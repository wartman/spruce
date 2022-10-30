package spruce.layer;

import pine.*;

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
  
  @track public var status:LayerContextStatus = Showing;

  public function hide():Void {
    status = Hiding;
  }
  
  public function show():Void {
    status = Showing;
  }
}
