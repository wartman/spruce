package spruce.paper;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Paper extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    backgroundColor: theme(spruce.paper.bgColor),
    border: theme(spruce.paper.border.appearance),
    borderRadius: theme(spruce.paper.border.radius),
    boxShadow: theme(spruce.paper.shadow),
    backgroundClip: 'padding-box'
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
        'spruce-paper',
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
