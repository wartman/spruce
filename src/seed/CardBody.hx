package seed;

import pine.*;
import pine.html.*;

class CardBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Box({
      children: children
    });
  }
}