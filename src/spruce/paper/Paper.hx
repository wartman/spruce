package spruce.paper;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Paper extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    backgroundColor: theme(spruce.paper.background.color),
    backgroundClip: 'padding-box',
    ':focus-visible': {
      outline: 'none'
    }
  });

  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final layout:Layout = Auto;
  @prop final borderRadius:BorderRadius = Medium;
  @prop final shadow:Shadow = Medium;
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
      shadow: shadow,
      borderRadius: borderRadius,
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
