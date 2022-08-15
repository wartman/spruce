package seed;

import pine.*;
import pine.html.*;
import seed.style.Stack;

using Nuke;

class ControlGroup extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final controls:HtmlChildren;
  
  public function render(context:Context) {
    return new Box({
      styles: Stack.horizontal.with([
        'seed-control-group',
        styles
      ]),
      children: controls
    });
  }
}
