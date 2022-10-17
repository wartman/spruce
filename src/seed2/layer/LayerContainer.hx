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
    var status = layer.status.get();

    return new Transition({
      transitions: switch status {
        case Showing: layer.props.showTransition;
        case Hiding: layer.props.hideTransition;
      },
      speed: layer.props.transitionSpeed,
      onTransition: () -> switch status {
        case Showing:
          if (layer.props.onShow != null) layer.props.onShow();
        case Hiding:
          if (layer.props.onHide != null) layer.props.onHide();
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
        'seed-overlay',
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
