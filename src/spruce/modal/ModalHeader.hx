package spruce.modal;

import eg.LayerContext;
import spruce.box.Box;
import spruce.control.*;
import spruce.core.*;
import spruce.icon.*;

class ModalHeader extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;
 
  function build() {
    return new Box({
      tag: Header,
      layout: LayoutStyle.Horizontal,
      padding: SpacingStyle.Medium,
      styles: Breeze.compose(
        'spruce-modal-header',
        Flex.alignItems('center'),
        styles
      ),
      children: [
        new Box({
          styles: Breeze.compose(
            'spruce-modal-header-info',
            Spacing.margin('right', 'auto')
          ),
          children: [ child ]
        }),
        new ControlGroup({
          styles: 'spruce-modal-header-controls',
          controls: [
            new ControlButton({
              onClick: _ -> LayerContext.from(this).hide(),
              ariaLabel: 'Close',
              child: new Close({
                styles: Breeze.compose(
                  Sizing.width(5),
                  Sizing.height(5)
                )
              })
            })
          ]
        })
      ]
    });
  }
}
