package seed2.collapse;

import pine.*;
import pine.html.*;
import seed2.core.Box;
import seed2.animation.Animated;

using Nuke;

class CollapseBody extends ObserverComponent {
  @prop final children:HtmlChildren;
  @prop final styles:ClassName = null;

  function render(context:Context) {
    var collapse = CollapseContext.from(context);

    return new Animated({
      dontAnimateInitial: true,
      createKeyframes: switch collapse.status {
        case Collapsed: context -> [
          { height: getHeight(context), offset: 0 },
          { height: 0, offset: 1 }
        ];
        case Expanded: context -> [
          { height: 0, offset: 0 },
          { height: getHeight(context), offset: 1 }
        ];
      },
      onFinished: context -> {
        #if (js && !nodejs)
        var el:js.html.Element = context.getObject();
        switch collapse.status {
          case Collapsed: el.style.height = '0';
          case Expanded: el.style.height = 'auto';
        }
        #end
      },
      duration: collapse.duration,
      child: new Box({
        styles: [
          Css.atoms({ overflow: 'hidden', height: 0 }),
          styles
        ],
        children: children
      })
    });
  }

  function getHeight(context:Context) {
    #if (js && !nodejs)
    var el:js.html.Element = context.getObject();
    return el.scrollHeight.px();
    #else
    return 'auto';
    #end
  }
}
