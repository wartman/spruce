package spruce.control;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class ControlGroup extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final controls:HtmlChildren;
  
  public function render(context:Context) {
    return new Box({
      styles: [
        'spruce-control-group',
        styles
      ],
      layout: Horizontal,
      children: controls
    });
  }
}

