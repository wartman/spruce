package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CollapseHeader extends ObserverComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  // @track var collapsed:Bool = true;
  
  // override function init(context:InitContext) {
  //   Effect.on(context).add(() -> {
  //     CollapseContext.from(context).toggle(collapsed);
  //   });
  // }

  public function render(context:Context) {
    var collapse = CollapseContext.from(context);
    var isCollapsed = collapse.collapsed.get();
    return new Box({
      styles: [
        Css.atoms({
          ':hover': { cursor: 'pointer' },
          width: 100.pct()
        }),
        'seed-collapse-header',
        styles
      ],
      layout: Horizontal,
      onClick: _ -> collapse.toggle(!isCollapsed),
      children: [
        child,
        // @todo: This is temporary
        new Html<'span'>({
          children: if (isCollapsed) '+' else '-'
        })
      ]
    });
  }
}
