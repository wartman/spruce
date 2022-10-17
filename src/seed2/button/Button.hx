package seed2.button;

import pine.*;
import pine.html.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.html.TagTypes.getTypeForTag;
import seed2.core.*;

using Nuke;

class Button extends HtmlElementComponent<GlobalAttr & ButtonAttr & AnchorAttr & HtmlEvents> {
  public static final baseStyles = Css.atoms({
    display: 'inline-block',
    outline: 'none',
    border: 'none',
    fontFamily: theme(seed.button.font.family, theme(seed.font.family)),
    fontSize: theme(seed.button.font.size, theme(seed.font.size)),
    fontWeight: theme(seed.button.font.weight),
    textAlign: 'center',
    textDecoration: 'none',
    verticalAlign: 'middle',
    boxSizing: theme(seed.box.sizing, 'border-box'),
    padding: [ theme(seed.button.padding.y), theme(seed.button.padding.x) ],
    borderRadius: theme(seed.button.border.radius),
    // borderWidth: theme(seed.button.border.width),
    // borderStyle: theme(seed.button.border.style),
  });
  public static final focusStyles = Css.atoms({
    ':focus': {
      boxShadow: theme(
        seed.button.focus.shadow,
        // @todo: this needs some work:
        [ 0, 0, 0, .25.rem(), rgba(0, 0, 0, .25) ]
      )
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
          'seed-button',
          'seed-button-${priority.toString()}',
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
