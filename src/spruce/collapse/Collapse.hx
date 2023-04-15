package spruce.collapse;

import eg.AccordionContext;
import eg.CollapseContext;
import pine.*;
import spruce.core.BorderRadius;
import spruce.core.Box;

using Nuke;

class Collapse extends AutoComponent {
  public static final baseStyles = Css.atoms({
    borderStyle: 'solid',
    borderWidth: 1.px(),
    borderColor: theme(spruce.color.neutral300),
    backgroundColor: theme(spruce.color.neutral0),
  });

  final styles:ClassName = null;
  final children:Children;
  final borderRadius:BorderRadius = Medium;
  final duration:Int = 200;

  function build() {
    var collapse = new CollapseContext({ 
      status: Collapsed,
      duration: duration
    });
    switch AccordionContext.maybeFrom(this) {
      case Some(accordion): accordion.add(collapse);
      case None:
    }
    return new CollapseContextProvider({
      value: collapse,
      dispose: collapse -> {
        switch AccordionContext.maybeFrom(this) {
          case Some(accordion): accordion.remove(collapse);
          case None:
        }
        collapse.dispose();
      },
      build: collapse -> new Box({
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
