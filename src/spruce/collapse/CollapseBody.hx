package spruce.collapse;

import eg.Animated;
import eg.CollapseContext;
import eg.Keyframes;
import spruce.box.Box;
import pine.signal.*;

class CollapseBody extends AutoComponent {
  final children:Children;
  final styles:ClassName = null;

  function build() {
    var collapse = CollapseContext.from(this);
    return new Animated({
      dontAnimateInitial: true,
      dontRepeatCurrentAnimation: true,
      keyframes: new Computation(() -> switch collapse.status() {
        case Collapsed: new Keyframes('collapse', context -> [
          { height: getHeight(context), offset: 0 },
          { height: 0, offset: 1 }
        ]);
        case Expanded: new Keyframes('expand', context -> [
          { height: 0, offset: 0 },
          { height: getHeight(context), offset: 1 }
        ]);
      }),
      onFinished: context -> {
        #if (js && !nodejs)
        var el:js.html.Element = context.getObject();
        switch collapse.status.peek() {
          case Collapsed: el.style.height = '0';
          case Expanded: el.style.height = 'auto';
        }
        #end
      },
      duration: collapse.duration,
      child: new Box({
        styles: Breeze.compose(
          styles,
          Layout.overflow('hidden'),
          Sizing.height(0),
          Spacing.pad('x', 2),
          Spacing.margin(0)
        ),
        children: children
      })
    });
  }
  
  function getHeight(context:Component) {
    #if (js && !nodejs)
    var el:js.html.Element = context.getObject();
    return el.scrollHeight + 'px';
    #else
    return 'auto';
    #end
  }
}