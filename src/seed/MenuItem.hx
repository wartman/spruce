package seed;

import pine.*;
import pine.html.*;

using Nuke;

class MenuItem extends ImmutableComponent {
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Box({
      tag: ListItem,
      children: [ child ]
    });
  }
}
