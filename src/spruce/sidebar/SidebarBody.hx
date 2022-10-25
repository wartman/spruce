package spruce.sidebar;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class SidebarBody extends ImmutableComponent {
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: [
          theme(spruce.sidebar.padding.y, theme(spruce.box.padding.y)),
          theme(spruce.sidebar.padding.x, theme(spruce.box.padding.x))
        ]
      }).with([
        'spruce-sidebar-body'
      ]),
      children: children
    });
  }
}
