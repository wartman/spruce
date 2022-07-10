package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CollapseHeader extends ObserverComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @track var collapsed:Bool = false;
  
  override function init(context:InitContext) {
    Effect.on(context).add(() -> {
      CollapseContext.from(context).toggle(collapsed);
    });
  }

  public function render(context:Context) {
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
      onClick: _ -> collapsed = !collapsed,
      children: [
        child,
        // @todo: This is temporary
        new Html<'span'>({
          children: if (collapsed) '-' else '+'
        })
      ]
    });
  }
}
