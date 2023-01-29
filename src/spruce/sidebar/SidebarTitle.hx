package spruce.sidebar;

import pine.*;
import pine.html.*;

using Nuke;

class SidebarTitle extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;

  public function render(context:Context) {
    return new Html<'h5'>({
      className: Css.atoms({
        marginBottom: 0,
        lineHeight: theme(spruce.sidebarTitle.lineHeight)
      }).with([
        'spruce-sidebar-title',
        styles
      ]),
      children: [ child ]
    });
  }
}
