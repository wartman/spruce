package spruce.core;

@:using(LayoutStyle.LayoutStyleTools)
enum LayoutStyle {
  Auto;
  Vertical;
  Horizontal;
}

class LayoutStyleTools {
  public static function toStyle(layout:LayoutStyle):ClassName {
    return switch layout {
      case Auto: '';
      case Vertical: vertical;
      case Horizontal: horizontal;
    }
  }

  public static function toString(layout:LayoutStyle) {
    return switch layout {
      case Auto: 'auto';
      case Vertical: 'vertical';
      case Horizontal: 'horizontal';
    }
  }
}

private final vertical = Breeze.compose(
  Flex.display(),
  Flex.direction('column')
);

private final horizontal = Breeze.compose(
  Flex.display(),
  Flex.direction('row')
);
