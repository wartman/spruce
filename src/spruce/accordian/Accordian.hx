package spruce.accordian;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.accordian.AccordianContext;

using Nuke;

class Accordian extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final sticky:Bool = false;
  @prop final children:HtmlChildren;
  @prop final spacing:Spacing = Small;

  function render(context:Context) {
    return new AccordianContextProvider({
      create: () -> new AccordianContext({ sticky: sticky }),
      dispose: accordian -> accordian.dispose(),
      render: accordian -> new Box({
        styles: [
          'spruce-accordian',
          styles
        ],
        spacing: spacing,
        layout: Vertical, // todo: make configurable
        children: children
      })
    });
  }
}
