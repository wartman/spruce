package seed;

import pine.*;
import pine.html.*;

using Nuke;

class ModalFooter extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [ theme(seed.modal.padding.y), theme(seed.modal.padding.x) ],
        justifyContent: 'flex-end'
      }).with([
        'seed-modal-footer'
      ]),
      layout: Horizontal,
      children: children
    });
  }
}
