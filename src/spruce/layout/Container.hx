package spruce.layout;

import pine.*;
import pine.html.*;
import spruce.core.*;

using Nuke;

enum ContainerKind {
  Fluid;
  Sm;
  Md;
  Lg;
  Xl;
}

class Container extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    display: 'flex',
    marginLeft: 'auto',
    marginRight: 'auto',
    width: 100.pct(),
    paddingLeft: theme(spruce.container.padding.x, theme(spruce.grid.xGap)),
    paddingRight: theme(spruce.container.padding.x, theme(spruce.grid.xGap)),
  });

  @prop final kind:ContainerKind = Fluid;
  @prop final layout:Layout = Auto;
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      styles: [
        'spruce-container',
        baseStyles,
        switch kind {
          case Fluid: null;
          case Sm: Css.atoms({ maxWidth: Constants.breakpointSm });
          case Md: Css.atoms({ maxWidth: Constants.breakpointMd });
          case Lg: Css.atoms({ maxWidth: Constants.breakpointLg });
          case Xl: Css.atoms({ maxWidth: Constants.breakpointXl });
        },
        layout.toStyle(),
        styles
      ],
      children: children
    });
  }
}
