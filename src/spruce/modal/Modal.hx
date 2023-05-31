package spruce.modal;

import spruce.paper.Paper;

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
  
  function build() {
    var paper = new Paper({
      styles: [
        'spruce-modal-container',
        styles,
        Sizing.width('screen'),
        switch size {
          case Sm: Breakpoint.viewport('200px', Sizing.width('200px'));
          case Md: Breakpoint.viewport('md', Sizing.width('500px'));
          case Lg: Breakpoint
            .viewport('md', Sizing.width('500px'))
            .with(Breakpoint.viewport('lg', Sizing.width('900px')));
        }
      ],
      onClick: e -> e.stopPropagation(),
      focusable: true,
      role: 'dialog',
      children: children
    });

    return new eg.Modal({
      layerStyles: Breeze.compose(
        'spruce-overlay',
        Layout.position('fixed'),
        Layout.attach('inset', 0),
        Layout.overflow('x', 'hidden'),
        Layout.overflow('y', 'scroll'),
        Background.color('rgba(0,0,0,0.5)'),
        Flex.display(),
        Flex.justify('center'),
        Flex.alignItems('center')
      ),
      onHide: onHide,
      hideOnEscape: hideOnEscape,
      children: paper
    });
  }
}