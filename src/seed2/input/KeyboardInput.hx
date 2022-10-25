package seed2.input;

import pine.*;
import pine.html.*;

class KeyboardInput extends ImmutableComponent {
  @prop final child:HtmlChild;

  function render(context:Context) {
    return child;
  }
}
