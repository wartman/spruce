package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.text.Heading;

using Nuke;

class ModalTitle extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final level:Int = 5;
  @prop final child:HtmlChild;

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
