package seed2.sidebar;

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
        lineHeight: theme(seed.sidebarTitle.lineHeight)
      }).with([
        'seed-sidebar-title',
        styles
      ]),
      children: [ child ]
    });
  }
}
