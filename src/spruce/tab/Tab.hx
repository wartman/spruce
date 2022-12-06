package spruce.tab;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class Tab extends AutoComponent {
  public final label:HtmlChild;
  public final buttonStyles:ClassName = null;
  final child:HtmlChild;
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
