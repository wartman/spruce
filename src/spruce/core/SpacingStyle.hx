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
      case Small: Flex.gap('.75rem');
      case Medium: Flex.gap('1rem');
      case Large: Flex.gap('1.25rem');
    }
  }

  public static function toPadding(spacing:SpacingStyle):ClassName {
    return switch spacing {
      case None: '';
      case Small: Spacing.pad('.75rem');
      case Medium: Spacing.pad('1rem');
      case Large: Spacing.pad('1.25rem');
    }
  }

  public static function toBottomMargin(spacing:SpacingStyle):ClassName {
    return switch spacing {
      case None: '';
      case Small: Spacing.margin('bottom', '.75rem');
      case Medium: Spacing.margin('bottom', '1rem');
      case Large: Spacing.margin('bottom', '1.25rem');
    }
  }
}
