package seed2.sidebar;

import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

class SidebarBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

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
