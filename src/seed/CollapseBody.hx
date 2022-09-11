package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CollapseBody extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  override function init(context:InitContext) {
    CollapseContext.from(context).activate(context.getObject);
  }

  public function render(context:Context) {
    return new Box({
      styles: [
        Css.atoms({
          overflow: 'hidden',
          height: 0.px(),
        }),
        'seed-collapse-body',
        styles
      ],
      children: children
    });
  }
}
