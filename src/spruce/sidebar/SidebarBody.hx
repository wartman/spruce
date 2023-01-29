package spruce.sidebar;

import pine.*;
import spruce.core.Box;

using Nuke;

class SidebarBody extends AutoComponent {
  final children:Children;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        padding: theme(spruce.spacing.medium)
      }).with([
        'spruce-sidebar-body'
      ]),
      children: children
    });
  }
}
