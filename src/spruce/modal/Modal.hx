package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.layer.*;
import spruce.dom.DomTools;

using Nuke;

enum ModalSize {
  Sm;
  Md;
  Lg;
}

class Modal extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final size:ModalSize = Md;
  @prop final hideOnEscape:Bool = true;

  public function render(context:Context):Component {
    var body = new Box({
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

    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        hideOnEscape: hideOnEscape,
        beforeShow: () -> {
          lockBody();
        },
        onHide: () -> {
          unlockBody();
          onHide();
        },
        child: new LayerTarget({ child: body })
      })
    });
  }
  
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
}
