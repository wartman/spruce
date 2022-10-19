package seed2.layer;

import pine.*;
import pine.html.*;
import seed2.animation.TransitionGroup;

using Nuke;

class Layer extends ImmutableComponent {
  @prop final beforeShow:()->Void = null;
  @prop final onShow:()->Void = null;
  @prop final onHide:()->Void;
  @prop final hideOnClick:Bool = true;
  @prop final hideOnEscape:Bool = true;
  @prop final child:HtmlChild;
  @prop final transitionSpeed:Int = 300;
  @prop final showTransition:TransitionGroup = [ { property: 'opacity', start: '0', end: '1' } ];
  @prop final hideTransition:TransitionGroup = null;

  override function init(context:InitContext) {
    if (beforeShow != null) beforeShow();
  }

  public function render(context:Context):Component {
    return new LayerContextProvider({
      create: () -> new LayerContext({
        showTransition: showTransition,
        hideTransition: hideTransition == null
          ? showTransition.invert()
          : hideTransition,
        transitionSpeed: transitionSpeed,
        onHide: onHide,
        onShow: onShow
      }),
      dispose: layer -> layer.dispose(),
      render: layer -> new LayerContainer({
        hideOnClick: hideOnClick,
        child: child
      })
    });
  }
}
