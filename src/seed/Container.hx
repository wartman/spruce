package seed;

import pine.*;
import pine.html.*;
import seed.style.*;

using Nuke;

enum ContainerKind {
  Fluid;
  Sm;
  Md;
  Lg;
  Xl;
}

class Container extends ImmutableComponent {
  @prop final kind:ContainerKind = Fluid;
  @prop final layout:Layout = Auto;
  @prop final styles:ClassName = null;
  @prop final children:Array<HtmlChild>;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        display: 'flex',
        marginLeft: 'auto',
        marginRight: 'auto',
        paddingLeft: theme(seed.container.padding.x, theme(seed.grid.xGap)),
        paddingRight: theme(seed.container.padding.x, theme(seed.grid.xGap)),
      }).with([
        'seed-container',
        switch kind {
          case Fluid: Css.atoms({ width: 100.pct() });
          case Sm: Css.atoms({ maxWidth: Constants.breakpointSm });
          case Md: Css.atoms({ maxWidth: Constants.breakpointMd });
          case Lg: Css.atoms({ maxWidth: Constants.breakpointLg });
          case Xl: Css.atoms({ maxWidth: Constants.breakpointXl });
        },
        layout.toStyle(),
        styles
      ]),
      children: children
    });
  }
}
