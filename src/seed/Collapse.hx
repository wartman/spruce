package seed;

import pine.*;
import pine.html.*;
import seed.animation.AnimationContext;
import seed.CollapseContext;

using Nuke;

class Collapse extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final speed:Int = 300;
  @prop final collapsed:Bool = true;

  public function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> switch AccordianContext.maybeFrom(context) {
        case None: new CollapseContext({
          collapsed: collapsed,
          animation: AnimationContext.from(context),
          speed: speed
        });
        case Some(accordian): accordian.createCollapseContext();
      },
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
