package seed2.modal;

import seed2.focus.FocusOn;
import pine.*;
import pine.html.*;
import seed2.core.*;

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
    var box = new Box({
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
    });

    return new FocusOn({ child: box });
  }
}
