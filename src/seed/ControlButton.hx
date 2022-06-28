package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

class ControlButton extends ImmutableComponent {
  @prop final onClick:EventListener;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Html<'button'>({
      onclick: onClick,
      role: 'button',
      className: Css.atoms({
        outline: 'none',
        border: 'none',
        background: 'transparent',
        color: theme(seed.controlButton.color, 'inherit'),
        fontFamily: theme(seed.controlButton.font.family, theme(seed.font.family)),
        fontSize: theme(seed.controlButton.font.size, theme(seed.font.size)),
        fontWeight: theme(seed.controlButton.font.weight),
      }),
      children: [ child ]
    });
  }
}
