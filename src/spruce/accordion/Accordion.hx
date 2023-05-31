package spruce.accordion;

import eg.AccordionContext;
import spruce.box.Box;
import spruce.core.*;

class Accordion extends AutoComponent {
  final styles:ClassName = null;
  final sticky:Bool = false;
  final children:Children;
  final spacing:SpacingStyle = Small;

  function build() {
    return new AccordionContextProvider({
      value: new AccordionContext({ sticky: sticky }),
      child: accordion -> new Box({
        styles: Breeze.compose(
          'spruce-accordion',
          styles
        ),
        spacing: spacing,
        layout: LayoutStyle.Vertical, // todo: make configurable
        children: children
      })
    });
  }
}
