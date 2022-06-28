package seed;

import pine.*;
import pine.html.*;

using Nuke; 

class Card extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:Array<HtmlChild>;

  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        position: 'relative',
        display: 'flex',
        flexDirection: 'column',
        minWidth: 0,
        wordWrap: 'break-word',
        border: [
          theme(seed.card.border.width, theme(seed.rounded.border.width)), 
          theme(seed.card.border.style, theme(seed.rounded.border.style, 'solid')), 
          theme(seed.card.border.color, theme(seed.rounded.border.color))
        ],
        padding: [
          theme(seed.card.padding.y, theme(seed.rounded.padding.y, theme(seed.box.padding.y))),
          theme(seed.card.padding.x, theme(seed.rounded.padding.x, theme(seed.box.padding.x)))
        ],
        borderRadius: theme(seed.card.border.radius, theme(seed.rounded.border.radius)),
        backgroundColor: theme(seed.card.bgColor),
        color: theme(seed.card.color)
      }).with([
        'seed-card',
        styles
      ]),
      children: children
    });
  }
}
