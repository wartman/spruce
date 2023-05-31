package spruce.menu;

import pine.html.HtmlEvents;
import spruce.box.Box;
import spruce.core.*;

class Menu extends AutoComponent {
  final layout:LayoutStyle = Horizontal;
  final spacing:SpacingStyle = Small;
  final styles:ClassName = null;
  final onClick:EventListener = null;
  final children:Children;
  final role:String = null;

  public function build() {
    return new Box({
      tag: UnorderedList,
      onClick: onClick,
      layout: layout,
      spacing: spacing,
      padding: SpacingStyle.None,
      role: role,
      styles: Breeze.compose(
        'spruce-menu',
        styles
      ),
      children: children
    });
  }
}

