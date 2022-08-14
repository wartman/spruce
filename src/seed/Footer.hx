package seed;

import pine.*;
import pine.html.*;
import seed.Container;

using Nuke;

class Footer extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final kind:ContainerKind = Lg;

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
