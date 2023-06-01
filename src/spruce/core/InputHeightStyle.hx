package spruce.core;

@:using(InputHeightStyle.InputHeightStyleTools)
enum InputHeightStyle {
  Sm;
  Md;
  Lg;
}

class InputHeightStyleTools {
  public static function toStyle(height:InputHeightStyle):ClassName {
    return switch height {
      case Sm: Sizing.height(7.5); // 30px
      case Md: Sizing.height(10); // 40px
      case Lg: Sizing.height(12.5); // 50px
    }
  }  
}
