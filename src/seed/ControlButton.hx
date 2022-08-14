package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

class ControlButton extends ImmutableComponent {
  public static final baseStyles =  Css.atoms({
    outline: 'none',
    border: 'none',
    background: 'transparent',
    color: theme(seed.controlButton.color, 'inherit'),
    padding: 0,
    margin: 0,
    fontFamily: theme(seed.controlButton.font.family, theme(seed.font.family)),
    fontSize: theme(seed.controlButton.font.size, theme(seed.font.size)),
    fontWeight: theme(seed.controlButton.font.weight),
    // height: theme(seed.controlButton.height, 1.em()),
    // width: theme(seed.controlButton.width, 1.em()),
  }); 

  @prop final onClick:EventListener;
  @prop final styles:ClassName = null;
  @prop final arialLabel:String;
  @prop final child:HtmlChild = null;

  public function render(context:Context) {
    return new Html<'button'>({
      onclick: onClick,
      role: 'button',
      ariaLabel: arialLabel,
      className: baseStyles.with([
        'seed-control-button',
        styles
      ]),
      children: child == null ? [] : [ child ]
    });
  }
}
