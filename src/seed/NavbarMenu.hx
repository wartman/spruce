package seed;

import pine.*;
import pine.html.*;

using Nuke;

class NavbarMenu extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Menu({
      styles: Css.atoms({
        alignItems: 'center'
      }).with([
        'seed-navbar-menu',
        styles
      ]),
      layout: Horizontal,
      children: children
    });
  }
}
