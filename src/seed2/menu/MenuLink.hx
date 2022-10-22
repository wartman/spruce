package seed2.menu;

import pine.*;
import pine.html.*;

using Nuke;

enum MenuLinkKind {
  Link(url:String);
  Action(action:()->Void);
}

// @todo: These need to be tabbed into with keyboard input.
class MenuLink extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    display: 'block',
    color: theme(seed.menu.link.color, theme(seed.link.color))
  }).with('seed-menu-link');

  @prop final kind:MenuLinkKind;
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Html<'a'>({
      className: baseStyles.with(styles),
      href: switch kind {
        case Link(url): url;
        default: null;
      },
      role: switch kind {
        case Action(_): 'button';
        default: null;
      },
      onclick: switch kind {
        case Action(action): 
          e -> {
            e.preventDefault();
            action();
          }
        default: null;
      },
      children: [ child ]
    });
  } 
}