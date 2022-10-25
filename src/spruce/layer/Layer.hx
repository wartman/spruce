package spruce.layer;

import pine.*;
import pine.html.*;
import spruce.animation.Keyframes;

using Nuke;

class Layer extends ImmutableComponent {
  @prop final beforeShow:()->Void = null;
  @prop final onShow:()->Void = null;
  @prop final onHide:()->Void;
  @prop final hideOnClick:Bool = true;
  @prop final hideOnEscape:Bool = true;
  @prop final child:HtmlChild;
  @prop final transitionSpeed:Int = 150;
  @prop final styles:ClassName = null;
  @prop final showAnimation:Keyframes = [ { opacity: 0 }, { opacity: 1 } ];
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
        styles: styles,
        hideOnClick: hideOnClick,
        child: child
      })
    });
  }
}
