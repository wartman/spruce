package spruce.core;

using Nuke;

@:using(spruce.core.Shadow.ShadowTools)
enum Shadow {
  None;
  XSmall;
  Small;
  Medium;
  Large;
  XLarge;
}

class ShadowTools {
  public static function toStyle(shadow:Shadow):ClassName {
    return switch shadow {
      case None: '';
      case XSmall: Css.atoms({ boxShadow: theme(spruce.shadow.xSmall) });
      case Small: Css.atoms({ boxShadow: theme(spruce.shadow.small) });
      case Medium: Css.atoms({ boxShadow: theme(spruce.shadow.medium) });
      case Large: Css.atoms({ boxShadow: theme(spruce.shadow.large) });
      case XLarge: Css.atoms({ boxShadow: theme(spruce.shadow.xLarge) });
    }
  }
}
