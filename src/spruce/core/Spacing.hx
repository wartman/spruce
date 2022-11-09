package spruce.core;

using Nuke;

@:using(spruce.core.Spacing.SpacingTools)
enum Spacing {
  None;
  Small;
  Medium;
  Large;
}

class SpacingTools {
  public static function toStyle(spacing:Spacing):ClassName {
    return switch spacing {
      case None: '';
      case Small: Css.atoms({
        gap: theme(spruce.spacing.small)
      });
      case Medium: Css.atoms({
        gap: theme(spruce.spacing.medium)
      });
      case Large: Css.atoms({
        gap: theme(spruce.spacing.large)
      });
    }
  }
}