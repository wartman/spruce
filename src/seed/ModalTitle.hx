package seed;

import pine.*;
import pine.html.*;

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
        lineHeight: theme(seed.modalTitle.lineHeight)
      }).with([
        'seed-modal-title',
        styles
      ]),
      children: [ child ]
    });
  }
}
