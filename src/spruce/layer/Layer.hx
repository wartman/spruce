package spruce.layer;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.animation.Animated;
import spruce.animation.Keyframes;
import spruce.layer.LayerContext;

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
      render: layer -> new Isolate({
        wrap: _ -> {
          var status = layer.status;
          var body = new Box({
            styles: Css.atoms({
              position: 'fixed',
              display: 'flex',
              flexWrap: 'wrap',
              justifyContent: 'center',
              alignItems: 'center',
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              overflowX: 'hidden',
              overflowY: 'scroll',
              backgroundColor: theme(spruce.layer.bgColor, theme(spruce.color.scrim)),
              zIndex: 9999
            }).with([
              'spruce-layer',
              styles
            ]),
            onclick: e -> if (hideOnClick) {
              e.preventDefault();
              layer.hide();
            },
            children: [ child ]
          });
          var animation = new Animated({
            createKeyframes: switch status { 
              case Showing: layer.showAnimation;
              case Hiding: layer.hideAnimation;
            },
            duration: layer.transitionSpeed,
            onFinished: _ -> switch status {
              case Showing:
                if (layer.onShow != null) layer.onShow();
              case Hiding:
                if (layer.onHide != null) layer.onHide();
            },
            child: body
          });

          return new LayerContainer({
            hideOnEscape: hideOnEscape,
            child: animation
          });
        }
      })
    });
  }
}
