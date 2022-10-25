package spruce.menu;

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
    color: theme(spruce.menu.link.color, theme(spruce.link.color)),
    padding: [
      theme(spruce.menu.link.padding.y),
      theme(spruce.menu.link.padding.x)
    ]
  });

  @prop final kind:MenuLinkKind;
  @prop final styles:ClassName = null;
  @prop final selectedStyles:ClassName = null;
  @prop final selected:Bool = false;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Html<'a'>({
      className: baseStyles
        .with(styles)
        .with(selected ? selectedStyles : null)
        .with('spruce-menu-link'),
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