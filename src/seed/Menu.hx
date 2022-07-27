package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

class Menu extends ImmutableComponent {
  @prop final layout:Layout = Horizontal;
  @prop final styles:ClassName = null;
  @prop final onClick:EventListener = null;
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({
      tag: UnorderedList,
      onClick: onClick,
      layout: layout,
      styles: Css.atoms({
        listStyle: 'none',
        padding: 0,
        margin: 0
      }).with([
        'seed-menu',
        styles
      ]),
      children: children
    });
  }
}
