package seed2.control;

import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

class ControlGroup extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final controls:HtmlChildren;
  
  public function render(context:Context) {
    return new Box({
      styles: [
        'seed-control-group',
        styles
      ],
      layout: Horizontal,
      children: controls
    });
  }
}

