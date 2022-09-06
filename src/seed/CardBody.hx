package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CardBody extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    padding: [ theme(seed.card.padding.y), theme(seed.card.padding.x) ],
    backgroundColor: theme(seed.card.bgColor),
    color: theme(seed.card.color, 'inherit'),
    borderLeft: theme(seed.card.border.appearance),
    borderRight: theme(seed.card.border.appearance),
    borderBottom: theme(seed.card.border.appearance),
    borderBottomLeftRadius: theme(seed.card.border.radius),
    borderBottomRightRadius: theme(seed.card.border.radius)
  });

  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final priority:Priority = null;

  function render(context:Context) {
    return new Box({
      styles: [
        'seed-card-body',
        baseStyles,
        styles
      ],
      children: children
    });
  }
}