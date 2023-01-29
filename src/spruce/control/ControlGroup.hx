package spruce.control;

import pine.*;
import spruce.core.Box;

using Nuke;

class ControlGroup extends AutoComponent {
  final styles:ClassName = null;
  final controls:Children;
  
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

