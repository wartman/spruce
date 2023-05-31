package spruce.modal;

import spruce.box.Box;
import spruce.core.*;

class ModalBody extends AutoComponent {
  final children:Children;

  public function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-modal-body',
        Breakpoint.markContainer('spruce-modal', 'inline-size')
      ),
      padding: SpacingStyle.Medium,
      children: children
    });
  }
}
