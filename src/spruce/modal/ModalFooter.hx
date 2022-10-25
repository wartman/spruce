package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class ModalFooter extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [ theme(spruce.modal.padding.y), theme(spruce.modal.padding.x) ],
        justifyContent: 'flex-end'
      }).with([
        'spruce-modal-footer'
      ]),
      layout: Horizontal,
      children: children
    });
  }
}
