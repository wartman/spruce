package spruce.control;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.button.Button;

using Nuke;

class ControlButton extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    outline: 'none',
    border: 'none',
    background: 'transparent',
    color: theme(spruce.controlButton.color, 'inherit'),
    padding: 0,
    margin: 0,
    fontFamily: theme(spruce.controlButton.font.family, theme(spruce.font.family)),
    fontSize: theme(spruce.controlButton.font.size, theme(spruce.font.size)),
    fontWeight: theme(spruce.controlButton.font.weight),
    borderRadius: 50.pct()
  });

  public static final baseDisabledStyles = Css.atoms({
    color: theme(spruce.controlButton.disabled.color, 'inherit'),
    opacity: theme(spruce.controlButton.disabled.opacity, 0.4)
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
          'spruce-control-button',
          styles,
          Button.focusStyles,
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
          'spruce-control-button',
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
        'spruce-control-button',
        if (disabled) baseDisabledStyles else null,
        if (disabled) disabledStyles else null,
        Button.focusStyles,
        styles
      ]),
      children: child == null ? [] : [ child ]
    });
  }
}
