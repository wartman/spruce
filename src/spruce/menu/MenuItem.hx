package spruce.menu;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class MenuItem extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    padding: [
      theme(spruce.menu.item.padding.y, 0.rem()),
      theme(spruce.menu.item.padding.x, 0.rem())
    ]
  });

  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

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
