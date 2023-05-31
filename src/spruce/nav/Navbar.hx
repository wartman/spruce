package spruce.nav;

import pine.*;
import spruce.box.Box;
import spruce.core.*;
import spruce.layout.Container;

enum abstract NavbarTag(BoxTag) to BoxTag {
  final Nav = BoxTag.Nav;
  final Header = BoxTag.Header;
}

class Navbar extends AutoComponent {
  final tag:NavbarTag = Nav;
  final kind:ContainerKind = Lg;
  final spacing:SpacingStyle = None;
  final styles:ClassName = null;
  final children:Children;

  public function build():Component {
    return new Box({
      tag: tag,
      styles: Breeze.compose(
        'spruce-navbar',
        styles
      ),
      children: [
        new Container({
          kind: kind,
          spacing: spacing,
          layout: Horizontal,
          styles: Breeze.compose(
            Flex.alignItems('center'),
            Spacing.pad('y', 5)
          ),
          // styles: Css.atoms({ 
          //   alignItems: 'center',
          //   paddingTop: theme(spruce.spacing.small),
          //   paddingBottom: theme(spruce.spacing.small)
          // }),
          children: children
        })
      ]
    });
  }
}
