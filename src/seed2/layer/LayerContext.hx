package seed2.layer;

import pine.*;
import seed2.animation.TransitionGroup;

typedef LayerContextProps = {
  showTransition:TransitionGroup,
  hideTransition:TransitionGroup,
  transitionSpeed:Int,
  ?onShow:()->Void,
  ?onHide:()->Void
}; 

enum LayerContextStatus {
  Showing;
  Hiding;
}

@:allow(seed2.layer)
class LayerContext implements Disposable {
  public static function createDefault(onShow, onHide) {
    var transition:TransitionGroup = [
      { property: 'opacity', start: '0', end: '1' }
    ];
    return new LayerContext({
      showTransition: transition,
      hideTransition: transition.invert(),
      transitionSpeed: 300,
      onHide: onHide,
      onShow: onShow
    });
  }

  public static function from(context:Context) {
    return LayerContextProvider.from(context);
  }
  
  public final status:State<LayerContextStatus> = new State(Showing);
  public final props:LayerContextProps;

  public function new(props) {
    this.props = props;
  }

  public function hide():Void {
    status.set(Hiding);
  }
  
  public function show():Void {
    status.set(Showing);
  }

  public function dispose() {}
}
