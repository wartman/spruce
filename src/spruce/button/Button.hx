package spruce.button;

import pine.html.HtmlEvents;
import spruce.core.*;

class Button extends AutoComponent {
  public static final baseStyles = Breeze.compose(
    Typography.textAlign('center'),
    Typography.textDecoration('none'),
    Typography.textVerticalAlign('middle'),
    BorderStyle.Small.toStyle()
  );

  public static final focusStyles = Modifier.focusVisible(
    Border.outlineStyle('solid'),
    Border.outlineOffset('1px'),
    Border.outlineColor('primary', 600)
  );

  final tag:ButtonTag = Button;
  final styles:ClassName = null;
  final href:Null<String> = null;
  final kind:ButtonKind = null;
  final onClick:EventListener = null;
  final size:ButtonSize = Md;
  final priority:PriorityStyle = Neutral;
  final layout:LayoutStyle = Auto;
  final radius:BorderRadiusStyle = Medium;
  final spacing:SpacingStyle = None;
  final children:Children;

  function build() {
    var tag:ButtonTag = href == null ? tag : Anchor;
    return new ObjectComponent({
      createObject: (adaptor, attrs) -> adaptor.createCustomObject(tag, attrs),
      attributes: [
        'href' => switch tag {
          case Anchor: href;
          default: null;
        },
        'onclick' => switch tag {
          case Button: onClick;
          default: e -> {
            e.preventDefault();
            onClick(e);
          }
        },
        'role' => switch tag {
          case Button: null;
          default: 'button';
        },
        'type' => switch tag {
          case Button: kind;
          default: null;
        },
        'class' => baseStyles.with([
          'spruce-button',
          'spruce-button-${priority.toString()}',
          'spruce-button-${size}',
          focusStyles,
          priority.toStyle(),
          layout.toStyle(),
          spacing.toGap(),  
          radius.toStyle(),
          switch size {
            case Sm: Breeze.compose(
              Spacing.pad('x', 1.5),
              InputHeightStyle.Sm.toStyle()
            );
            case Md: Breeze.compose(
              Spacing.pad('x', 3),
              InputHeightStyle.Md.toStyle()
            );
            case Lg: Breeze.compose(
              Spacing.pad('x', 4),
              InputHeightStyle.Lg.toStyle()
            );
          },
          styles
        ])
      ],
      children: children
    });
  }
}