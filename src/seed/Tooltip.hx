package seed;

import pine.*;
import pine.html.*;

class Tooltip extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Popover({
      v: Top,
      h: Middle,
      getTarget: context.getObject,
      child: new Card({
        children: children
      })
    });
  }
}
