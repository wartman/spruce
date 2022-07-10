package seed;

import pine.*;
import pine.html.*;

using Nuke;

class ModalBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [
          theme(seed.modal.padding.y, theme(seed.rounded.padding.y, theme(seed.box.padding.y))),
          theme(seed.modal.padding.x, theme(seed.rounded.padding.x, theme(seed.box.padding.x)))
        ]
      }).with([
        'seed-modal-body'
      ]),
      children: children
    });
  }
}
