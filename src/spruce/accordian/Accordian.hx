package spruce.accordian;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.accordian.AccordianContext;

using Nuke;

class Accordian extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final sticky:Bool = false;
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new AccordianContextProvider({
      create: () -> new AccordianContext({ sticky: sticky }),
      dispose: accordian -> accordian.dispose(),
      render: accordian -> new Box({
        styles: [
          styles,
          'spruce-accordian'
        ],
        layout: Vertical, // todo: make configurable
        children: children
      })
    });
  }
}
