package spruce.collapse;

import eg.AccordionContext;
import eg.CollapseContext;
import spruce.core.*;
import spruce.panel.Panel;

class Collapse extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final radius:BorderRadiusStyle = Medium;
  final duration:Int = 200;

  function build() {
    var collapse = new CollapseContext({ 
      status: Collapsed,
      duration: duration
    });
    AccordionContext
      .maybeFrom(this)
      .ifExtract(Some(accordion), accordion.add(collapse));
    
    return new CollapseContextProvider({
      value: collapse,
      dispose: collapse -> {
        AccordionContext
          .maybeFrom(this)
          .ifExtract(Some(accordion), accordion.remove(collapse));
        collapse.dispose();
      },
      child: collapse -> new Panel({
        styles: Breeze.compose(
          'spruce-collapse',
          styles
        ),
        radius: radius,
        children: children
      })
    });
  }
}
