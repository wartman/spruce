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
  public static function toGap(spacing:Spacing):ClassName {
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

  public static function toPadding(spacing:Spacing):ClassName {
    return switch spacing {
      case None: '';
      case Small: Css.atoms({
        padding: theme(spruce.spacing.small)
      });
      case Medium: Css.atoms({
        padding: theme(spruce.spacing.medium)
      });
      case Large: Css.atoms({
        padding: theme(spruce.spacing.large)
      });
    }
  }

  public static function toMargin(spacing:Spacing):ClassName {
    return switch spacing {
      case None: '';
      case Small: Css.atoms({
        margin: theme(spruce.spacing.small)
      });
      case Medium: Css.atoms({
        margin: theme(spruce.spacing.medium)
      });
      case Large: Css.atoms({
        margin: theme(spruce.spacing.large)
      });
    }
  }
}
