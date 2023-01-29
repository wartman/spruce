package spruce.menu;

import pine.*;
import pine.html.HtmlEvents;
import spruce.core.*;

using Nuke;

class Menu extends AutoComponent {
  final layout:Layout = Horizontal;
  final spacing:Spacing = Small;
  final styles:ClassName = null;
  final onClick:EventListener = null;
  final children:Children;
  final role:String = null;

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
