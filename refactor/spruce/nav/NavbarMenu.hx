package spruce.nav;

import pine.*;
import pine.html.*;
import spruce.menu.Menu;

using Nuke;

class NavbarMenu extends AutoComponent {
  final styles:ClassName = null;
  final children:HtmlChildren;

  public function render(context:Context) {
    return new Menu({
      styles: [
        'spruce-navbar-menu',
        Css.atoms({ alignItems: 'center' }),
        styles
      ],
      layout: Horizontal,
      children: children
    });
  }
}
