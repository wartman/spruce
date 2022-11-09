package spruce.panel;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Panel extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    backgroundColor: theme(spruce.paper.background.color),
    borderRadius: theme(spruce.border.radius.medium),
    boxShadow: theme(spruce.shadow.medium),
    borderStyle: 'solid',
    borderWidth: theme(spruce.panel.border.width),
    borderColor: theme(spruce.panel.border.color),
    backgroundClip: 'padding-box',
    ':focus-visible': {
      outline: 'none'
    }
  });

  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final layout:Layout = Auto;
  @prop final focusable:Bool = false;
  @prop final role:String = null;
  @prop final onClick:EventListener = null;

  function render(context:Context) {
    return new Box({  
      styles: [
        'spruce-panel',
        baseStyles,
        styles
      ],
      layout: layout,
      ariaModal: focusable ? 'true' : null,
      tabIndex: focusable ? -1 : null,
      role: role == null 
        ? focusable ? 'dialog' : null
        : role,
      onclick: onClick,
      children: children
    });
  }
}