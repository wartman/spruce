package spruce.nav;

import pine.*;
import spruce.menu.Menu;

using Nuke;

class NavbarMenu extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

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
