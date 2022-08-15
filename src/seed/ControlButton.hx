package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

class ControlButton extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    outline: 'none',
    border: 'none',
    background: 'transparent',
    color: theme(seed.controlButton.color, 'inherit'),
    padding: 0,
    margin: 0,
    fontFamily: theme(seed.controlButton.font.family, theme(seed.font.family)),
    fontSize: theme(seed.controlButton.font.size, theme(seed.font.size)),
    fontWeight: theme(seed.controlButton.font.weight)
  });

  public static final baseDisabledStyles = Css.atoms({
    color: theme(seed.controlButton.disabled.color, 'inherit'),
    opacity: theme(seed.controlButton.disabled.opacity, 0.4)
  });

  @prop final onClick:EventListener = null;
  @prop final href:String = null;
  @prop final styles:ClassName = null;
  @prop final disabledStyles:ClassName = null;
  @prop final ariaLabel:String;
  @prop final child:HtmlChild = null;
  @prop final disabled:Bool = false;

  public function render(context:Context):Component {
    var onClick = e -> {
      if (!disabled) onClick(e);
    }

    if (href != null) {
      return if (disabled) new Html<'span'>({
        className: baseStyles.with([
          'seed-control-button',
          styles,
          baseDisabledStyles,
          disabledStyles
        ]),
        children: child == null ? [] : [ child ]
      }) else new Html<'a'>({
        onclick: onClick,
        href: href,
        role: 'button',
        ariaLabel: ariaLabel,
        className: baseStyles.with([
          'seed-control-button',
          styles
        ]),
        children: child == null ? [] : [ child ]
      });
    }
    
    return new Html<'button'>({
      onclick: onClick,
      role: 'button',
      ariaLabel: ariaLabel,
      disabled: disabled,
      className: baseStyles.with([
        'seed-control-button',
        if (disabled) baseDisabledStyles else null,
        if (disabled) disabledStyles else null,
        styles
      ]),
      children: child == null ? [] : [ child ]
    });
  }
}
