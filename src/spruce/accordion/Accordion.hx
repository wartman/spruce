package spruce.accordion;

import eg.AccordionContext;
import pine.*;
import spruce.core.*;

using Nuke;

class Accordion extends AutoComponent {
  final styles:ClassName = null;
  final sticky:Bool = false;
  final children:Children;
  final spacing:Spacing = Small;

  function build() {
    return new AccordionContextProvider({
      value: new AccordionContext({ sticky: sticky }),
      build: accordion -> new Box({
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
