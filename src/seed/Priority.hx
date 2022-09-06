package seed;

using Nuke;

@:using(seed.Priority.PriorityTools)
enum Priority {
  Primary;
  Secondary;
  Success;
  Danger;
  Warning;
  Info;
}

class PriorityTools {
  public static function toStyle(priority:Priority) {
    return switch priority {
      case Primary: Css.atoms({ 
        backgroundColor: theme(seed.priority.primary.bgColor),
        color: theme(seed.priority.primary.color),
        border: theme(seed.priority.primary.border)
      });
      case Secondary: Css.atoms({ 
        backgroundColor: theme(seed.priority.secondary.bgColor),
        color: theme(seed.priority.secondary.color),
        border: theme(seed.priority.secondary.border)
      });
      case Success: Css.atoms({ 
        backgroundColor: theme(seed.priority.success.bgColor),
        color: theme(seed.priority.success.color),
        border: theme(seed.priority.success.border)
      });
      case Danger: Css.atoms({ 
        backgroundColor: theme(seed.priority.danger.bgColor),
        color: theme(seed.priority.danger.color),
        border: theme(seed.priority.danger.border)
      });
      case Warning: Css.atoms({ 
        backgroundColor: theme(seed.priority.warning.bgColor),
        color: theme(seed.priority.warning.color),
        border: theme(seed.priority.warning.border)
      });
      case Info: Css.atoms({ 
        backgroundColor: theme(seed.priority.info.bgColor),
        color: theme(seed.priority.info.color),
        border: theme(seed.priority.info.border)
      });
    }
  }

  public static function toString(priority:Priority):String {
    return switch priority {
      case Primary: 'primary';
      case Secondary: 'secondary';
      case Success: 'success';
      case Danger: 'danger';
      case Warning: 'warning';
      case Info: 'info';
    }
  }
}
