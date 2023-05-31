package spruce.modal;

import pine.*;
import spruce.box.Box;
import spruce.core.*;

class ModalFooter extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

  public function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-modal-footer',
        Flex.justify('end')
      ),
      layout: LayoutStyle.Horizontal,
      spacing: SpacingStyle.Small,
      padding: SpacingStyle.Medium,
      children: children
    });
  }
}
