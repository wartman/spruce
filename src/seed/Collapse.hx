package seed;

import pine.*;
import pine.html.*;
import seed.CollapseContext;

using Nuke;

class Collapse extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final collapsed:Bool = false;

  public function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> new CollapseContext(),
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
