package spruce.layout;

import pine.*;
import spruce.box.Box;
import spruce.layout.Container;

class Footer extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;
  final kind:ContainerKind = Lg;

  public function build() {
    return new Box({
      tag: Footer,
      styles: Breeze.compose(
        'spruce-footer',
        styles,
        Background.color('secondary', 800),
        Typography.textColor('neutral', 0),
        Spacing.pad('y', 10),
        Spacing.margin('top', 10)
      ),
      children: new Container({
        kind: kind,
        children: children
      }) 
    });
  }
}
