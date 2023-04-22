package spruce.button;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import pine.html.HtmlAttributes;
import spruce.core.*;

using Nuke;

class Button extends AutoComponent {
  public static final baseStyles = Css.atoms({
    outline: 'none',
    border: 'none',
    fontFamily: 'inherit',
    fontSize: theme(spruce.button.font.size.medium),
    fontWeight: theme(spruce.font.weight.semibold),
    lineHeight: theme(spruce.input.height.medium),
    height: theme(spruce.input.height.medium),
    textAlign: 'center',
    textDecoration: 'none',
    verticalAlign: 'middle',
    boxSizing: 'border-box',
    padding: [ 0, theme(spruce.spacing.medium)],
    borderWidth: theme(spruce.input.border.width),
    borderStyle: 'solid'
  });
  public static final focusStyles = Css.atoms({
    ':focus-visible': {
      outline: theme(spruce.focus.ring),
      outlineOffset: theme(spruce.focus.ring.offset)
    }
  });

  final props:ButtonProps;

  public function new(props) {
    this.props = props;
  }

  function build() {
    var tag:ButtonTag = props.href != null 
      ? Anchor 
      : props.tag == null
        ? Button
        : props.tag;
    var priority:Priority = props.priority ?? Neutral;
    var layout:Layout = props.layout ?? Auto;
    var spacing:Spacing = props.spacing ?? None;
    var radius:BorderRadius = props.borderRadius ?? Medium;
    var size:ButtonSize = props.size ?? Md;

    return new HtmlObjectComponent<GlobalAttr & ButtonAttr & AnchorAttr & HtmlEvents & { ?children:Children }>(tag, {
      href: switch tag {
        case Anchor: props.href;
        default: null;
      },
      onClick: switch tag {
        case Button: props.onClick;
        default: e -> {
          e.preventDefault();
          props.onClick(e);
        }
      },
      role: switch tag {
        case Button: null;
        default: 'button';
      },
      type: switch tag {
        case Button: props.kind;
        default: null;
      },
      className: baseStyles.with([
        'spruce-button',
        'spruce-button-${priority.toString()}',
        'spruce-button-${size}',
        focusStyles,
        priority.toStyle(),
        layout.toStyle(),
        spacing.toGap(),  
        radius.toStyle(),
        props.styles
      ]),
      children: props.children
    });
  }
}

typedef ButtonProps = {
  ?tag:ButtonTag,
  ?priority:Priority,
  ?layout:Layout,
  ?spacing:Spacing,
  ?borderRadius:BorderRadius,
  ?kind:ButtonKind,
  ?size:ButtonSize,
  ?styles:ClassName,
  ?href:String,
  ?onClick:EventListener,
  ?children:Children
};
