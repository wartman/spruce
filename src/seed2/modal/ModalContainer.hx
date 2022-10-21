package seed2.modal;

import seed2.animation.TransitionGroup;
import pine.*;
import pine.html.*;
import seed2.core.*;
import seed2.animation.Transition;

using Nuke;

enum ModalContainerSize {
  Sm;
  Md;
  Lg;
}

class ModalContainer extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final size:ModalContainerSize = Md;
  @prop final transition:TransitionGroup = { property: 'margin-top', start: '-100px', end: '0' };
  @prop final transitionSpeed:Int = 200;

  function getContainerSize() {
    return switch size {
      case Sm: Css.mediaQuery({
        type: 'screen',
        minWidth: 200.px()
      }, {
        width: 200.px()
      });
      case Md: Breakpoint.md({
        width: Constants.breakpointMd
      });
      case Lg: Breakpoint.md({
        width: Constants.breakpointMd
      }).with(Breakpoint.lg({
        width: Constants.breakpointLg
      }));
    }
  }

  public function render(context:Context) {
    return new Transition({
      transitions: transition,
      speed: transitionSpeed,
      child: new Box({
        styles: Css.atoms({
          width: 100.vw(),
          marginLeft: theme(seed.grid.xGap),
          marginRight: theme(seed.grid.xGap),
          backgroundColor: theme(seed.modal.bgColor, theme(seed.color.light)),
          color: theme(seed.modal.color, theme(seed.color.dark)),
          borderRadius: theme(seed.modal.border.radius),
          backgroundClip: 'padding-box'
        }).with([
          'seed-modal-container',
          styles,
          getContainerSize()
        ]),
        onClick: e -> e.stopPropagation(),
        role: 'dialog',
        children: children
      })
    });
  }
}
