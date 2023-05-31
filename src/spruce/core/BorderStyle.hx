package spruce.core;

@:using(BorderStyle.BorderStyleTools)
enum BorderStyle {
  None;
  Small;
  Medium;
  Large;
}

class BorderStyleTools {
  public static function toStyle(border:BorderStyle):ClassName {
    return switch border {
      case None: '';
      case Small: Breeze.compose(
        Border.style('solid'),
        Border.width(.5)
      );
      case Medium: Breeze.compose(
        Border.style('solid'),
        Border.width(1)
      );
      case Large: Breeze.compose(
        Border.style('solid'),
        Border.width(1.5)
      );
    }
  }
}
