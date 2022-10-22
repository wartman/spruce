package seed2.menu;

import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

class MenuItem extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Box({
      tag: ListItem,
      styles: styles,
      children: [ child ]
    });
  }
}
