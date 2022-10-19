package seed2.layer;

import seed2.animation.Transition;
import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

class LayerContainer extends ObserverComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final hideOnClick:Bool = true;

  public function render(context:Context) {
    var layer = LayerContext.from(context);
    var status = layer.status;

    return new Transition({
      transitions: switch status {
        case Showing: layer.showTransition;
        case Hiding: layer.hideTransition;
      },
      speed: layer.transitionSpeed,
      onTransition: () -> switch status {
        case Showing:
          if (layer.onShow != null) layer.onShow();
        case Hiding:
          if (layer.onHide != null) layer.onHide();
      },
      render: () -> renderContent(context)
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
        backgroundColor: theme(seed.layer.bgColor, theme(seed.color.scrim)),
        zIndex: 9999
      }).with([
        'seed-layer',
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
