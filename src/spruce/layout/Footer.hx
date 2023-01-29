package spruce.layout;

import pine.*;
import spruce.core.Box;
import spruce.layout.Container;

using Nuke;

class Footer extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final kind:ContainerKind = Lg;

  public function render(context:Context) {
    return new Box({
      tag: Footer,
      styles: [
        'seed-footer',
        styles,
        Css.atoms({
          backgroundColor: theme(seed.footer.bgColor, theme(seed.color.dark)),
          color: theme(seed.footer.bgColor, theme(seed.color.light)),
          paddingTop: theme(seed.box.padding.y),
          paddingBottom: theme(seed.box.padding.y),
          marginTop: theme(seed.grid.gap)
        })
      ],
      children: new Container({
        kind: kind,
        children: children
      }) 
    });
  }
}
