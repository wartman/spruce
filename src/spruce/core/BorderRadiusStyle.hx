package spruce.core;

@:using(spruce.core.BorderRadiusStyle.BorderRadiusStyleTools)
enum BorderRadiusStyle {
  None;
  Small;
  Medium;
  Large;
  XLarge;
  Circle;
  Pill;
}

class BorderRadiusStyleTools {
  public static function toStyle(radius:BorderRadiusStyle):ClassName {
    return switch radius {
      case None: '';
      case Small: Border.radius(.5);
      case Medium: Border.radius(1);
      case Large: Border.radius(1.5);
      case XLarge: Border.radius(2);
      case Circle: Border.radius('50%');
      case Pill: Border.radius('9999px');
    }
  }
}
