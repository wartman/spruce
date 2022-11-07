package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class ModalBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [ theme(spruce.paper.padding.y), theme(spruce.paper.padding.x) ]
      }).with([
        'spruce-modal-body'
      ]),
      children: children
    });
  }
}
