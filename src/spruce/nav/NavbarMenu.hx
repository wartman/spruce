package spruce.nav;

import pine.*;
import spruce.menu.Menu;

class NavbarMenu extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

  public function build() {
    return new Menu({
      styles: Breeze.compose(
        'spruce-navbar-menu',
        Flex.alignItems('center'),
        styles
      ),
      layout: Horizontal,
      children: children
    });
  }
}
