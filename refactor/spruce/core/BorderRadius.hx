package spruce.core;

using Nuke;

@:using(spruce.core.BorderRadius.BorderRadiusTools)
enum BorderRadius {
  None;
  Small;
  Medium;
  Large;
  XLarge;
  Circle;
  Pill;
}

class BorderRadiusTools {
  public static function toStyle(radius:BorderRadius):ClassName {
    return switch radius {
      case None: '';
      case Small: Css.atoms({ borderRadius: theme(spruce.border.radius.small) });
      case Medium: Css.atoms({ borderRadius: theme(spruce.border.radius.medium) });
      case Large: Css.atoms({ borderRadius: theme(spruce.border.radius.large) });
      case XLarge: Css.atoms({ borderRadius: theme(spruce.border.radius.xLarge) });
      case Circle: Css.atoms({ borderRadius: theme(spruce.border.radius.circle) });
      case Pill: Css.atoms({ borderRadius: theme(spruce.border.radius.pill) });
    }
  }
}
