package spruce.core;

using Nuke;

@:using(spruce.core.Priority.PriorityTools)
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
        backgroundColor: theme(spruce.priority.primary.bgColor),
        color: theme(spruce.priority.primary.color),
        border: theme(spruce.priority.primary.border)
      });
      case Secondary: Css.atoms({ 
        backgroundColor: theme(spruce.priority.secondary.bgColor),
        color: theme(spruce.priority.secondary.color),
        border: theme(spruce.priority.secondary.border)
      });
      case Success: Css.atoms({ 
        backgroundColor: theme(spruce.priority.success.bgColor),
        color: theme(spruce.priority.success.color),
        border: theme(spruce.priority.success.border)
      });
      case Danger: Css.atoms({ 
        backgroundColor: theme(spruce.priority.danger.bgColor),
        color: theme(spruce.priority.danger.color),
        border: theme(spruce.priority.danger.border)
      });
      case Warning: Css.atoms({ 
        backgroundColor: theme(spruce.priority.warning.bgColor),
        color: theme(spruce.priority.warning.color),
        border: theme(spruce.priority.warning.border)
      });
      case Info: Css.atoms({ 
        backgroundColor: theme(spruce.priority.info.bgColor),
        color: theme(spruce.priority.info.color),
        border: theme(spruce.priority.info.border)
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
