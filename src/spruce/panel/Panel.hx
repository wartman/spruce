package spruce.panel;

import pine.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Panel extends AutoComponent {
  public static final baseStyles = Css.atoms({
    backgroundColor: theme(spruce.paper.background.color),
    borderStyle: 'solid',
    borderWidth: theme(spruce.panel.border.width),
    borderColor: theme(spruce.panel.border.color),
    backgroundClip: 'padding-box',
    ':focus-visible': {
      outline: 'none'
    }
  });

  final styles:ClassName = null;
  final children:Children;
  final layout:Layout = Auto;
  final shadow:Shadow = Medium;
  final borderRadius:BorderRadius = Medium;
  final focusable:Bool = false;
  final role:String = null;
  final onClick:EventListener = null;

  function render(context:Context) {
    return new Box({  
      styles: [
        'spruce-panel',
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