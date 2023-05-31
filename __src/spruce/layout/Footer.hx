package spruce.layout;

import pine.*;
import spruce.core.Box;
import spruce.layout.Container;

using Nuke;

class Footer extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final kind:ContainerKind = Lg;

  public function build() {
    return new Box({
      tag: Footer,
      styles: [
        'spruce-footer',
        styles,
        Css.atoms({
          backgroundColor: theme(spruce.footer.bgColor, theme(spruce.color.dark)),
          color: theme(spruce.footer.bgColor, theme(spruce.color.light)),
          paddingTop: theme(spruce.box.padding.y),
          paddingBottom: theme(spruce.box.padding.y),
          marginTop: theme(spruce.grid.gap)
        })
      ],
      children: new Container({
        kind: kind,
        children: children
      }) 
    });
  }
}
