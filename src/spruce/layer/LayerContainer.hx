package spruce.layer;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.animation.Animated;

using Nuke;

class LayerContainer extends ObserverComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final hideOnClick:Bool = true;

  public function render(context:Context) {
    var layer = LayerContext.from(context);
    var status = layer.status;

    return new Animated({
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
      child: renderContent(context)
    });
  }

  inline function renderContent(context:Context) {
    return new Box({
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
      onClick: e -> if (hideOnClick) {
        e.preventDefault();
        LayerContext.from(context).hide();
      },
      children: [ child ]
    });
  }
}
