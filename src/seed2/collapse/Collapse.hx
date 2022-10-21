package seed2.collapse;

import pine.*;
import pine.html.*;
import seed2.core.Box;
import seed2.collapse.CollapseContext;

using Nuke;

class Collapse extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final duration:Int = 200;

  function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> new CollapseContext({ 
        status: Collapsed,
        duration: duration
      }),
      dispose: collapse -> collapse.dispose(),
      render: collapse -> new Box({
        styles: [
          'seed-collapse',
          styles
        ],
        children: children
      })
    });
  }
}
