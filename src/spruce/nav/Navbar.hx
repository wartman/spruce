package spruce.nav;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.core.Spacing;
import spruce.layout.Container;

using Nuke;

enum abstract NavbarTag(BoxTag) to BoxTag {
  final Nav = BoxTag.Nav;
  final Header = BoxTag.Header;
}

class Navbar extends ImmutableComponent {
  @prop final tag:NavbarTag = Nav;
  @prop final kind:ContainerKind = Lg;
  @prop final spacing:Spacing = None;
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  public function render(context:Context):Component {
    return new Box({
      tag: tag,
      styles: [
        'spruce-navbar',
        styles
      ],
      children: [
        new Container({
          kind: kind,
          spacing: spacing,
          layout: Horizontal,
          styles: Css.atoms({
            alignItems: 'center'
          }),
          children: children
        })
      ]
    });
  }
}
