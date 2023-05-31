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
      case Sm: Sizing.height('1.875rem'); // 30px
      case Md: Sizing.height('2.5rem'); // 40px
      case Lg: Sizing.height('3.125rem'); // 50px
    }
  }  
}
