package spruce.paper;

import pine.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Paper extends AutoComponent {
  public static final baseStyles = Css.atoms({
    backgroundColor: theme(spruce.paper.background.color),
    backgroundClip: 'padding-box',
    ':focus-visible': {
      outline: 'none'
    }
  });

  final styles:ClassName = null;
  final children:Children;
  final layout:Layout = Auto;
  final borderRadius:BorderRadius = Medium;
  final shadow:Shadow = Medium;
  final focusable:Bool = false;
  final role:String = null;
  final onClick:EventListener = null;

  function build() {
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
      onClick: onClick,
      children: children
    });
  }
}
