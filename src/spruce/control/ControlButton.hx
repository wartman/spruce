package spruce.control;

import pine.html.HtmlEvents;
import spruce.button.Button;

class ControlButton extends AutoComponent {
  final onClick:EventListener = null;
  final href:String = null;
  final styles:ClassName = null;
  final ariaLabel:String;
  final child:Child = null;
  final disabled:Bool = false;

  public function build():Component {
    var baseStyles = Breeze.compose(
      Border.radius('50%'),
      Spacing.pad(0),
      Spacing.margin(0)
    );
    var onClick = e -> {
      if (!disabled) onClick(e);
    }

    if (href != null) {
      return if (disabled) new Html<'span'>({
        className: Breeze.compose(
          'spruce-control-button',
          baseStyles,
          styles,
          Effect.opacity(40)
        ),
        children: child == null ? [] : [ child ]
      }) else new Html<'a'>({
        onClick: onClick,
        href: href,
        role: 'button',
        ariaLabel: ariaLabel,
        className: Breeze.compose(
          'spruce-control-button',
          baseStyles,
          Button.focusStyles,
          styles
        ),
        children: child == null ? [] : [ child ]
      });
    }
    
    return new Html<'button'>({
      onClick: onClick,
      role: 'button',
      ariaLabel: ariaLabel,
      disabled: disabled,
      tabIndex: 0,
      className: Breeze.compose(
        'spruce-control-button',
        baseStyles,
        Button.focusStyles,
        Modifier.disabled(Effect.opacity(40)),
        styles
      ),
      children: child == null ? [] : [ child ]
    });
  }
}