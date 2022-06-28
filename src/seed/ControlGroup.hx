package seed;

import pine.*;
import seed.style.Stack;

using Nuke;

class ControlGroup extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final controls:Array<ControlButton>;
  
  public function render(context:Context) {
    var children:Array<Component> = cast controls;
    return new Box({
      styles: Stack.horizontal.with([
        'seed-control-group',
        styles
      ]),
      children: children
    });
  }
}
