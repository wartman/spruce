package seed;

import pine.*;
import pine.html.*;
import seed.AccordianContext;

using Nuke;

class Accordian extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:Array<Collapse>;

  function render(context:Context) {
    return new AccordianContextProvider({
      create: () -> new AccordianContext(),
      dispose: accordian -> accordian.dispose(),
      render: accordian -> new Box({
        styles: [
          styles,
          'seed-accordian'
        ],
        layout: Vertical, // todo: make configurable
        children: cast children
      })
    });
  }
}
