package spruce.nav;

import pine.*;
import spruce.core.Box;
import spruce.core.Spacing;
import spruce.layout.Container;

using Nuke;

enum abstract NavbarTag(BoxTag) to BoxTag {
  final Nav = BoxTag.Nav;
  final Header = BoxTag.Header;
}

class Navbar extends AutoComponent {
  final tag:NavbarTag = Nav;
  final kind:ContainerKind = Lg;
  final spacing:Spacing = None;
  final styles:ClassName = null;
  final children:Children;

  public function build():Component {
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
            alignItems: 'center',
            paddingTop: theme(spruce.spacing.small),
            paddingBottom: theme(spruce.spacing.small)
          }),
          children: children
        })
      ]
    });
  }
}
