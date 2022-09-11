package seed;

import seed.animation.AnimationContext;
import pine.html.HtmlChildren;
import pine.*;
import seed.AccordianContext;

using Nuke;

class Accordian extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final sticky:Bool = false;
  @prop final speed:Int = 300;
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new AccordianContextProvider({
      create: () -> new AccordianContext({
        sticky: sticky,
        speed: speed,
        animation: AnimationContext.from(context)
      }),
      dispose: accordian -> accordian.dispose(),
      render: accordian -> new Box({
        styles: [
          styles,
          'seed-accordian'
        ],
        layout: Vertical, // todo: make configurable
        children: children
      })
    });
  }
}
