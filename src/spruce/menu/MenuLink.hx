package spruce.menu;

import pine.*;
import pine.html.*;

using Nuke;

enum MenuLinkKind {
  Link(url:String);
  Action(action:()->Void);
}

class MenuLink extends ImmutableComponent {
  public static final baseStyles = Css.atoms({
    display: 'block',
    textDecoration: 'none',
    ':focus-visible': {
      outline: theme(spruce.focus.ring),
      outlineOffset: theme(spruce.focus.ring.offset)
    }
  });

  @prop final kind:MenuLinkKind;
  @prop final styles:ClassName = null;
  @prop final selectedStyles:ClassName = null;
  @prop final selected:Bool = false;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Html<'a'>({
      className: ClassName.ofArray([
        'spruce-menu-link',
        baseStyles,
        styles,
        selected ? selectedStyles : null
      ]),
      href: switch kind {
        case Link(url): url;
        default: '#'; // Required to allow tabbing.
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