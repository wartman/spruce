package spruce.tab;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class Tab extends ImmutableComponent {
  @prop public final label:HtmlChild;
  @prop public final buttonStyles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final styles:ClassName = null; 

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
