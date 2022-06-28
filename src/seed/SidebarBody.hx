package seed;

import pine.*;
import pine.html.*;

using Nuke;

class SidebarBody extends ImmutableComponent {
  @prop final children:Array<HtmlChild>;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [
          theme(seed.sidebar.padding.y, theme(seed.box.padding.y)),
          theme(seed.sidebar.padding.x, theme(seed.box.padding.x))
        ]
      }).with([
        'seed-sidebar-body'
      ]),
      children: children
    });
  }
}
