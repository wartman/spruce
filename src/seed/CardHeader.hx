package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CardHeader extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    padding: [ theme(seed.card.padding.y), theme(seed.card.padding.x) ],
    borderTopLeftRadius: theme(seed.card.border.radius),
    borderTopRightRadius: theme(seed.card.border.radius)
  });

  @prop final styles:ClassName = null;
  @prop final priority:Priority = null;
  @prop final children:HtmlChildren;

  public function render(context:Context):Component {
    return new Box({
      tag: Header,
      styles: [
        'seed-card-header',
        baseStyles,
        if (priority != null) priority.toStyle() else null,
        styles
      ],
      children: children
    });
  }
}
