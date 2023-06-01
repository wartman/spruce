package spruce.core;

@:using(SpacingStyle.SpacingStyleTools)
enum SpacingStyle {
  None;
  Small;
  Medium;
  Large;
}

class SpacingStyleTools {
  public static function toGap(spacing:SpacingStyle):ClassName {
    return switch spacing {
      case None: '';
      case Small: Flex.gap(3);
      case Medium: Flex.gap(4);
      case Large: Flex.gap(5);
    }
  }

  public static function toPadding(spacing:SpacingStyle):ClassName {
    return switch spacing {
      case None: '';
      case Small: Spacing.pad(3);
      case Medium: Spacing.pad(4);
      case Large: Spacing.pad(5);
    }
  }

  public static function toBottomMargin(spacing:SpacingStyle):ClassName {
    return switch spacing {
      case None: '';
      case Small: Spacing.margin('bottom', 3);
      case Medium: Spacing.margin('bottom', 4);
      case Large: Spacing.margin('bottom', 5);
    }
  }
}
