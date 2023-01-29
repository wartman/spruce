package spruce.menu;

import pine.*;
import spruce.core.Box;

using Nuke;

class MenuItem extends AutoComponent {
  public static final baseStyles = Css.atoms({
    padding: [
      theme(spruce.menu.item.padding.y, 0.rem()),
      theme(spruce.menu.item.padding.x, 0.rem())
    ]
  });

  final styles:ClassName = null;
  final child:Child;

  public function render(context:Context) {
    return new Box({
      tag: ListItem,
      styles: [
        'spruce-menu-item',
        styles,
        baseStyles
      ],
      children: [ child ]
    });
  }
}
