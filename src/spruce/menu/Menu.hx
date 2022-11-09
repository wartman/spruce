package spruce.menu;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Menu extends ImmutableComponent {
  @prop final layout:Layout = Horizontal;
  @prop final spacing:Spacing = Small;
  @prop final styles:ClassName = null;
  @prop final onClick:EventListener = null;
  @prop final children:HtmlChildren;
  @prop final role:String = null;

  public function render(context:Context) {
    return new Box({
      tag: UnorderedList,
      onclick: onClick,
      layout: layout,
      spacing: spacing,
      role: role,
      styles: Css.atoms({
        listStyle: 'none',
        padding: 0,
        margin: 0
      }).with([
        'spruce-menu',
        styles
      ]),
      children: children
    });
  }
}
