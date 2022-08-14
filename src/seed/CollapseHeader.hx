package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CollapseHeader extends ObserverComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    var collapse = CollapseContext.from(context);
    var isCollapsed = collapse.collapsed.get();
    return new Box({
      styles: [
        Css.atoms({
          ':hover': { cursor: 'pointer' },
          width: 100.pct(),
          // transition: [ 'margin-bottom', 300.ms() ]
        }),
        'seed-collapse-header',
        // if (!isCollapsed) Css.atoms({
        //   marginBottom: theme(seed.grid.gap)
        // }) else Css.atoms({
        //   marginBottom: 0
        // }),
        styles
      ],
      layout: Horizontal,
      onClick: _ -> collapse.toggle(!isCollapsed),
      children: [
        new Box({
          styles: Css.atoms({ marginRight: 'auto' }),
          children: [ child ]
        }),
        new Icon({
          styles: Css.atoms({
            width: 1.em(),
            height: 1.em()
          }),
          kind: isCollapsed ? ChevronDown : ChevronUp
        })
      ]
    });
  }
}
