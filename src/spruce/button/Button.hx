package spruce.button;

import pine.*;
import pine.core.UniqueId;
import pine.html.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.html.TagTypes.getTypeForTag;
import spruce.core.*;

using Nuke;

class Button extends HtmlElementComponent<GlobalAttr & ButtonAttr & AnchorAttr & HtmlEvents> {
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

  final type:UniqueId;

  public function new(props:{
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
    ?children:HtmlChildren
  }) {
    var tag:ButtonTag = props.href != null 
      ? Anchor 
      : props.tag == null
        ? Button
        : props.tag;
    var priority:Priority = props.priority == null
      ? Neutral
      : props.priority;
    var layout:Layout = props.layout == null
      ? Auto
      : props.layout;
    var spacing:Spacing = props.spacing == null
      ? None
      : props.spacing;
    var radius:BorderRadius = props.borderRadius == null
      ? Medium
      : props.borderRadius;
    var size:ButtonSize = props.size == null
      ? Md
      : props.size;

    type = getTypeForTag(tag);

    super({
      tag: tag,
      attrs: {
        href: switch tag {
          case Anchor: props.href;
          default: null;
        },
        onclick: switch tag {
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
        ])
      },
      children: props.children
    });
  }

  public function getComponentType():UniqueId {
    return type;
  }
}
