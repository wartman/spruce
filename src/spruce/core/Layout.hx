package spruce.core;

using Nuke;

@:using(spruce.core.Layout.LayoutTools)
enum Layout {
  Auto;
  Vertical;
  Horizontal;
}

class LayoutTools {
  public static function toStyle(layout:Layout):ClassName {
    return switch layout {
      case Auto: null;
      case Vertical: vertical;
      case Horizontal: horizontal;
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

private final vertical = Css.atoms({
  display: 'flex',
  flexDirection: 'column'
});

private final horizontal = Css.atoms({
  display: 'flex',
  flexDirection: 'row'
});