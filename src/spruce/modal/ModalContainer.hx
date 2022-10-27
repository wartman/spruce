package spruce.modal;

import spruce.focus.FocusOn;
import pine.*;
import pine.html.*;
import spruce.core.*;

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
      styles: [
        'spruce-modal-container',
        Css.atoms({
          width: 100.vw(),
          marginLeft: theme(spruce.grid.xGap),
          marginRight: theme(spruce.grid.xGap),
          backgroundColor: theme(spruce.modal.bgColor, theme(spruce.color.light)),
          color: theme(spruce.modal.color, theme(spruce.color.dark)),
          borderRadius: theme(spruce.modal.border.radius),
          backgroundClip: 'padding-box'
        }),
        styles,
        getContainerSize()
      ],
      onclick: e -> e.stopPropagation(),
      ariaModal: 'true',
      tabIndex: -1,
      role: 'dialog',
      children: children
    });

    return new FocusOn({ child: box });
  }
}
