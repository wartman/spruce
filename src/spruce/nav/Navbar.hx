package spruce.nav;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.layout.Container;

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
      styles: [
        'spruce-navbar',
        Css.atoms({
          backgroundColor: theme(spruce.navbar.bgColor),
          color: theme(spruce.navbar.color),
        }),
        styles
      ],
      children: [
        new Container({
          kind: kind,
          layout: Horizontal,
          styles: Css.atoms({
            alignItems: 'center',
            padding: [
              theme(spruce.navbar.padding.y, theme(spruce.box.padding.y)),
              theme(spruce.navbar.padding.x, theme(spruce.box.padding.x))
            ]
          }),
          children: children
        })
      ]
    });
  }
}
