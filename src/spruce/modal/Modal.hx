package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.layer.*;
import spruce.paper.Paper;
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
    var paper = new Paper({
      styles: [
        'seed-modal-container',
        styles,
        Css.atoms({ width: 100.vw() }),
        getContainerSize()
      ],
      onClick: e -> e.stopPropagation(),
      focusable: true,
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
        child: paper
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
