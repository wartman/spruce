package spruce.panel;

import pine.html.HtmlEvents;
import spruce.box.Box;
import spruce.core.*;

class Panel extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final layout:LayoutStyle = Auto;
  final shadow:ShadowStyle = None;
  final radius:BorderRadiusStyle = Medium;
  final border:BorderStyle = Small;
  final focusable:Bool = false;
  final role:String = null;
  final onClick:EventListener = null;

  function build() {
    return new Box({  
      styles: Breeze.compose(
        'spruce-panel',
        Background.color('neutral', 0),
        Background.clip('padding'),
        Border.color('neutral', 300),
        Modifier.focusVisible(Border.outlineStyle('none')),
        styles
      ),
      layout: layout,
      shadow: shadow,
      border: border,
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
