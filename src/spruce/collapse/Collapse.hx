package spruce.collapse;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.core.BorderRadius;
import eg.CollapseContext;
import eg.AccordionContext;

using Nuke;

class Collapse extends AutoComponent {
  public static final baseStyles = Css.atoms({
    borderStyle: 'solid',
    borderWidth: 1.px(),
    borderColor: theme(spruce.color.neutral300),
    backgroundColor: theme(spruce.color.neutral0),
  });

  final styles:ClassName = null;
  final children:HtmlChildren;
  final borderRadius:BorderRadius = Medium;
  final duration:Int = 200;

  function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> {
        var collapse = new CollapseContext({ 
          status: Collapsed,
          duration: duration
        });
        switch AccordionContext.maybeFrom(context) {
          case Some(accordian): accordian.add(collapse);
          case None:
        }
        return collapse;
      },
      dispose: collapse -> {
        switch AccordionContext.maybeFrom(context) {
          case Some(accordian): accordian.remove(collapse);
          case None:
        }
        collapse.dispose();
      },
      render: collapse -> new Box({
        styles: [
          'spruce-collapse',
          baseStyles,
          styles
        ],
        borderRadius: borderRadius,
        children: children
      })
    });
  }
}
