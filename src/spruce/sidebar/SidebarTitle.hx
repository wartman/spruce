package spruce.sidebar;

import pine.*;
import pine.html.*;

using Nuke;

class SidebarTitle extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

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
