package seed;

import pine.*;
import pine.html.*;

class CardBody extends ImmutableComponent {
  @prop final children:Array<HtmlChild>;

  function render(context:Context) {
    return new Box({
      children: children
    });
  }
}