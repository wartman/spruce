package spruce.paper;

import pine.html.HtmlEvents;
import spruce.core.*;
import spruce.box.Box;

class Paper extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final layout:LayoutStyle = Auto;
  final radius:BorderRadiusStyle = Medium;
  final shadow:ShadowStyle = Medium;
  final focusable:Bool = false;
  final role:String = null;
  final onClick:EventListener = null;

  function build() {
    return new Box({  
      styles: Breeze.compose(
        'spruce-paper',
        Background.color('neutral', 0),
        Background.clip('padding'),
        Modifier.focusVisible(Border.outlineStyle('none')),
        styles
      ),
      layout: layout,
      shadow: shadow,
      radius: radius,
      isModal: focusable ? true : null,
      tabIndex: focusable ? -1 : null,
      role: role == null 
        ? focusable ? 'dialog' : null
        : role,
      onClick: onClick,
      children: children
    });
  }
}
