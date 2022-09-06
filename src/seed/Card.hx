package seed;

import pine.*;
import pine.html.*;

using Nuke; 

class Card extends ImmutableComponent {
  public static final baseStyle = Css.atoms({
    position: 'relative',
    display: 'flex',
    flexDirection: 'column',
    minWidth: 0,
    wordWrap: 'break-word',
    borderRadius: theme(seed.card.border.radius),
    color: theme(seed.card.color)
  });

  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;
  @prop final layout:Layout = Auto;

  public function render(context:Context) {
    return new Box({
      styles: [
        'seed-card',
        baseStyle,
        styles
      ],
      layout: layout,
      children: children
    });
  }
}
