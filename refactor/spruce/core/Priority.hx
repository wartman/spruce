package spruce.core;

using Nuke;

@:using(spruce.core.Priority.PriorityTools)
enum Priority {
  Neutral;
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
      case Neutral: Css.atoms({ 
        backgroundColor: theme(spruce.color.neutral0),
        borderColor: theme(spruce.color.neutral300),
        color: theme(spruce.color.neutral700),
        ':hover': {
          backgroundColor: theme(spruce.color.primary50),
          borderColor: theme(spruce.color.primary300),
          color: theme(spruce.color.primary700),
        },
        ':active': {
          backgroundColor: theme(spruce.color.primary100),
          borderColor: theme(spruce.color.primary400),
          color: theme(spruce.color.primary700),
        }
      });
      case Primary: Css.atoms({ 
        backgroundColor: theme(spruce.color.primary600),
        borderColor: theme(spruce.color.primary600),
        color: theme(spruce.color.neutral0),
        ':hover': {
          backgroundColor: theme(spruce.color.primary500),
          borderColor: theme(spruce.color.primary500),
        },
        ':active': {
          backgroundColor: theme(spruce.color.primary600),
          borderColor: theme(spruce.color.primary600),
        }
      });
      case Secondary: Css.atoms({ 
        backgroundColor: theme(spruce.color.secondary600),
        color: theme(spruce.color.neutral0),
        borderColor: theme(spruce.color.secondary600),
        ':hover': {
          backgroundColor: theme(spruce.color.secondary500),
          borderColor: theme(spruce.color.secondary500),
        },
        ':active': {
          backgroundColor: theme(spruce.color.secondary600),
          color: theme(spruce.color.neutral0),
        }
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
