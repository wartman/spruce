package spruce.collapse;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.collapse.CollapseContext;
import spruce.accordian.AccordianContext;

using Nuke;

class Collapse extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final duration:Int = 200;

  function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> {
        var collapse = new CollapseContext({ 
          status: Collapsed,
          duration: duration
        });
        switch AccordianContext.maybeFrom(context) {
          case Some(accordian): accordian.add(collapse);
          case None:
        }
        return collapse;
      },
      dispose: collapse -> {
        switch AccordianContext.maybeFrom(context) {
          case Some(accordian): accordian.remove(collapse);
          case None:
        }
        collapse.dispose();
      },
      render: collapse -> new Box({
        styles: [
          'spruce-collapse',
          styles
        ],
        children: children
      })
    });
  }
}
