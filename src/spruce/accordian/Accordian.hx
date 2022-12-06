package spruce.accordian;

import pine.*;
import pine.html.*;
import spruce.core.*;
import eg.AccordianContext;

using Nuke;

class Accordian extends AutoComponent {
  final styles:ClassName = null;
  final sticky:Bool = false;
  final children:HtmlChildren;
  final spacing:Spacing = Small;

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
