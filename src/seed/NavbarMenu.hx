package seed;

import pine.*;

using Nuke;

class NavbarMenu extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final items:Array<MenuItem>;

  public function render(context:Context) {
    return new Menu({
      styles: Css.atoms({
        alignItems: 'center'
      }).with([
        'seed-navbar-menu',
        styles
      ]),
      layout: Horizontal,
      items: items
    });
  }
}
