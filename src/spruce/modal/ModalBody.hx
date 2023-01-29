package spruce.modal;

import pine.*;
import spruce.core.Box;

using Nuke;

class ModalBody extends AutoComponent {
  final children:Children;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: theme(spruce.spacing.medium)
      }).with([
        'spruce-modal-body'
      ]),
      children: children
    });
  }
}
