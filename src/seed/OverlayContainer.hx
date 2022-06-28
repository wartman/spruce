package seed;

import pine.*;
import pine.html.*;

using Nuke;

class OverlayContainer extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final hideOnClick:Bool = true;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        position: 'fixed',
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        backgroundColor: theme(seed.overlay.bgColor, theme(seed.color.scrim)),
        zIndex: 9999
      }).with([
        'seed-overlay',
        styles
      ]),
      onClick: e -> if (hideOnClick) {
        e.preventDefault();
        OverlayContext.from(context).hide();
      },
      children: [ child ]
    });
  }
}
