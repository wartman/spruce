package spruce.button;

import pine.*;
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
    fontFamily: theme(spruce.button.font.family, theme(spruce.font.family)),
    fontSize: theme(spruce.button.font.size, theme(spruce.font.size)),
    fontWeight: theme(spruce.button.font.weight),
    textAlign: 'center',
    textDecoration: 'none',
    verticalAlign: 'middle',
    boxSizing: theme(spruce.box.sizing, 'border-box'),
    padding: [ theme(spruce.button.padding.y), theme(spruce.button.padding.x) ],
    borderRadius: theme(spruce.button.border.radius),
  });
  public static final focusStyles = Css.atoms({
    ':focus-visible': {
      outline: theme(spruce.focus.ring),
      outlineOffset: theme(spruce.focus.offset)
    }
  });

  final type:UniqueId;

  public function new(props:{
    ?tag:ButtonTag,
    ?priority:Priority,
    ?layout:Layout,
    ?kind:ButtonKind,
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
      ? Secondary
      : props.priority;
    var layout:Layout = props.layout == null
      ? Auto
      : props.layout;

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
          focusStyles,
          priority.toStyle(),
          layout.toStyle(),
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
