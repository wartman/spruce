package spruce.menu;

import spruce.box.Box;

class MenuItem extends AutoComponent {
  // public static final baseStyles = Css.atoms({
  //   padding: [
  //     theme(spruce.menu.item.padding.y, 0.rem()),
  //     theme(spruce.menu.item.padding.x, 0.rem())
  //   ]
  // });

  final styles:ClassName = null;
  final child:Child;

  public function build() {
    return new Box({
      tag: ListItem,
      styles: Breeze.compose(
        'spruce-menu-item',
        styles
      ),
      children: [ child ]
    });
  }
}

