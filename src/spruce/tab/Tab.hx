package spruce.tab;

import pine.*;
import spruce.core.Box;

using Nuke;

class Tab extends AutoComponent {
  public final label:Child;
  public final buttonStyles:ClassName = null;
  final child:Child;
  final styles:ClassName = null; 

  function render(context:Context) {
    return new Box({
      styles: [
        'spruce-tab-panel',
        styles
      ],
      children: [ child ]
    });
  }
}
