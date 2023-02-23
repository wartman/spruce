package spruce.accordian;

import eg.AccordionContext;
import pine.*;
import spruce.core.*;

using Nuke;

class Accordion extends AutoComponent {
  final styles:ClassName = null;
  final sticky:Bool = false;
  final children:Children;
  final spacing:Spacing = Small;

  function render(context:Context) {
    return new AccordionContextProvider({
      create: () -> new AccordionContext({ sticky: sticky }),
      dispose: accordion -> accordion.dispose(),
      render: accordion -> new Box({
        styles: [
          'spruce-accordion',
          styles
        ],
        spacing: spacing,
        layout: Vertical, // todo: make configurable
        children: children
      })
    });
  }
}
