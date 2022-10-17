package seed2.modal;

import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

class ModalBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [ theme(seed.modal.padding.y), theme(seed.modal.padding.x) ]
      }).with([
        'seed-modal-body'
      ]),
      children: children
    });
  }
}
