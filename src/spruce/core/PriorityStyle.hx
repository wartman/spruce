package spruce.core;

@:using(PriorityStyle.PriorityStyleTools)
enum PriorityStyle {
  Neutral;
  Primary;
  Secondary;
  Success;
  Danger;
  Warning;
  Info;
}

class PriorityStyleTools {
  public static function toStyle(priority:PriorityStyle) {
    return switch priority {
      case Neutral: Breeze.compose(
        Background.color('neutral', 0),
        Border.color('neutral', 300),
        Typography.textColor('neutral', 700),
        Modifier.hover(
          Background.color('primary', 50),
          Border.color('primary', 300),
          Typography.textColor('primary', 700)
        ),
        Modifier.active(
          Background.color('primary', 100),
          Border.color('primary', 400),
          Typography.textColor('primary', 700)
        )
      );
      case Primary: Breeze.compose(
        Background.color('primary', 600),
        Border.color('primary', 600),
        Typography.textColor('neutral', 0),
        Modifier.hover(
          Background.color('primary', 500),
          Border.color('primary', 600)
        ),
        Modifier.active(
          Background.color('primary', 600),
          Border.color('primary', 600),
        )
      );
      case Secondary: Breeze.compose(
        Background.color('secondary', 600),
        Border.color('secondary', 600),
        Typography.textColor('neutral', 0),
        Modifier.hover(
          Background.color('secondary', 500),
          Border.color('secondary', 600)
        ),
        Modifier.active(
          Background.color('secondary', 600),
          Border.color('secondary', 600),
        )
      );
      case Success: Breeze.compose(
        Background.color('success', 600),
        Border.color('success', 600),
        Typography.textColor('neutral', 0),
      );
      case Danger: Breeze.compose(
        Background.color('danger', 600),
        Border.color('danger', 600),
        Typography.textColor('neutral', 0)
      );
      case Warning: Breeze.compose(
        Background.color('warning', 600),
        Border.color('warning', 600),
        Typography.textColor('neutral', 0)
      );
      case Info: Breeze.compose(
        Background.color('neutral', 600),
        Border.color('neutral', 600),
        Typography.textColor('neutral', 0)
      );
    }
  }

  public static function toString(priority:PriorityStyle):String {
    return switch priority {
      case Neutral: 'default';
      case Primary: 'primary';
      case Secondary: 'secondary';
      case Success: 'success';
      case Danger: 'danger';
      case Warning: 'warning';
      case Info: 'info';
    }
  }
}
