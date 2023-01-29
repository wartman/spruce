package spruce.modal;

import pine.*;
import spruce.typography.Heading;

using Nuke;

class ModalTitle extends AutoComponent {
  final styles:ClassName = null;
  final level:Int = 5;
  final child:Child;

  public function render(context:Context) {
    return new Heading({
      level: level,
      styles: Css.atoms({
        marginBottom: 0,
        lineHeight: theme(spruce.modalTitle.lineHeight)
      }).with([
        'spruce-modal-title',
        styles
      ]),
      children: [ child ]
    });
  }
}
