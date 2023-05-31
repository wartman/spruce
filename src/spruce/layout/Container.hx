package spruce.layout;

import pine.*;
import spruce.box.Box;
import spruce.core.*;

enum ContainerKind {
  Fluid;
  Sm;
  Md;
  Lg;
  Xl;
}

class Container extends AutoComponent {
  public static final baseStyles = Breeze.compose(
    Flex.display(),
    Spacing.margin('x', 'auto'),
    Spacing.pad('x', 10),
    Sizing.width('full'),
  );

  final kind:ContainerKind = Fluid;
  final spacing:SpacingStyle = None;
  final layout:LayoutStyle = Auto;
  final styles:ClassName = null;
  final children:Children;

  public function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-container',
        baseStyles,
        switch kind {
          case Fluid: null;
          case Sm: Layout.container('sm');
          case Md: Layout.container('md');
          case Lg: Layout.container('lg');
          case Xl: Layout.container('xl');
        },
        styles
      ),
      spacing: spacing,
      layout: layout,
      children: children
    });
  }
}
