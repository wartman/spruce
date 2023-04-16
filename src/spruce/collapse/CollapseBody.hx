package spruce.collapse;

import eg.Animated;
import eg.CollapseContext;
import eg.Keyframes;
import pine.*;
import spruce.core.Box;

using Nuke;

class CollapseBody extends AutoComponent {
  final children:Children;
  final styles:ClassName = null;

  function build() {
    var collapse = CollapseContext.from(this);
    return new Animated({
      dontAnimateInitial: true,
      dontRepeatCurrentAnimation: true,
      keyframes: compute(() -> switch collapse.status() {
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
        styles: [
          Css.atoms({ 
            overflow: 'hidden', 
            height: 0,
            padding: [
              0,
              theme(spruce.spacing.medium)
            ],
            margin: 0,
          }),
          styles
        ],
        children: children
      })
    });
  }

  function getHeight(context:Component) {
    #if (js && !nodejs)
    var el:js.html.Element = context.getObject();
    return el.scrollHeight.px();
    #else
    return 'auto';
    #end
  }
}
