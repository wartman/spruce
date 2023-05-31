package spruce.core;

@:using(ShadowStyle.ShadowStyleTools)
enum ShadowStyle {
  None;
  Small;
  Medium;
  Large;
  XLarge;
}

class ShadowStyleTools {
  public static function toStyle(shadow:ShadowStyle):ClassName {
    return switch shadow {
      case None: '';
      case Small: Breeze.compose(Effect.shadow('sm'));
      case Medium: Breeze.compose(Effect.shadow('md'));
      case Large: Breeze.compose(Effect.shadow('lg'));
      case XLarge: Breeze.compose(Effect.shadow('xl'));
    }
  }
}
