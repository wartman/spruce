package seed2.layer;

import pine.*;
import pine.html.*;
import seed2.animation.Keyframes;

using Nuke;

class Layer extends ImmutableComponent {
  @prop final beforeShow:()->Void = null;
  @prop final onShow:()->Void = null;
  @prop final onHide:()->Void;
  @prop final hideOnClick:Bool = true;
  @prop final hideOnEscape:Bool = true;
  @prop final child:HtmlChild;
  @prop final transitionSpeed:Int = 300;
  @prop final showAnimation:Keyframes = [
    { opacity: 0, offset: 0 },
    { opacity: 1, offset: 1 }
  ];
  @prop final hideAnimation:Keyframes = null;

  override function init(context:InitContext) {
    if (beforeShow != null) beforeShow();
  }

  public function render(context:Context):Component {
    return new LayerContextProvider({
      create: () -> new LayerContext({
        showAnimation: showAnimation,
        hideAnimation: hideAnimation == null
          ? showAnimation.invert()
          : hideAnimation,
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
