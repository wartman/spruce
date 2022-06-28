package seed;

import nuke.ClassName;
import seed.style.Stack;

@:using(seed.Layout.LayoutTools)
enum Layout {
  Auto;
  Vertical;
  Horizontal;
}

class LayoutTools {
  public static function toStyle(layout:Layout):ClassName {
    return switch layout {
      case Auto: null;
      case Vertical: Stack.vertical;
      case Horizontal: Stack.horizontal;
    }
  }

  public static function toString(layout:Layout) {
    return switch layout {
      case Auto: 'auto';
      case Vertical: 'vertical';
      case Horizontal: 'horizontal';
    }
  }
}
