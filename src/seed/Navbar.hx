package seed;

import pine.*;
import pine.html.*;
import seed.Container;
import seed.Box;

using Nuke;

enum abstract NavbarTag(BoxTag) to BoxTag {
  final Nav = BoxTag.Nav;
  final Header = BoxTag.Header;
}

class Navbar extends ImmutableComponent {
  @prop final tag:NavbarTag = Nav;
  @prop final kind:ContainerKind = Lg;
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  public function render(context:Context):Component {
    return new Box({
      tag: tag,
      styles: Css.atoms({
        backgroundColor: theme(seed.navbar.bgColor),
        color: theme(seed.navbar.color),
      }).with([
        'seed-navbar',
        styles
      ]),
      children: [
        new Container({
          kind: kind,
          layout: Horizontal,
          styles: Css.atoms({
            alignItems: 'center',
            padding: [
              theme(seed.navbar.padding.y, theme(seed.box.padding.y)),
              theme(seed.navbar.padding.x, theme(seed.box.padding.x))
            ]
          }),
          children: children
        })
      ]
    });
  }
}
