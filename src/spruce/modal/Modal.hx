package spruce.modal;

import pine.*;
import spruce.core.*;
import spruce.paper.Paper;

using Nuke;

enum ModalSize {
  Sm;
  Md;
  Lg;
}

class Modal extends AutoComponent {
  final styles:ClassName = null;
  final onHide:()->Void;
  final children:Children;
  final size:ModalSize = Md;
  final hideOnEscape:Bool = true;

  public function build():Component {
    var paper = new Paper({
      styles: [
        'spruce-modal-container',
        styles,
        Css.atoms({ width: 100.vw() }),
        getContainerSize()
      ],
      onClick: e -> e.stopPropagation(),
      focusable: true,
      role: 'dialog',
      children: children
    });

    return new eg.Modal({
      layerStyles: [
        'spruce-overlay',
        Overlay.baseStyles
      ],
      onHide: onHide,
      hideOnEscape: hideOnEscape,
      children: paper
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
