package spruce.menu;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

enum MenuLinkKind {
  Link(url:String);
  Action(action:()->Void);
}

class MenuLink extends AutoComponent {
  public static final baseStyles = Css.atoms({
    display: 'block',
    textDecoration: 'none',
    ':focus-visible': {
      outline: theme(spruce.focus.ring),
      outlineOffset: theme(spruce.focus.ring.offset)
    }
  });

  @:readonly final selected:Bool = false;
  @:readonly final kind:MenuLinkKind;
  final styles:ClassName = null;
  final selectedStyles:ClassName = null;
  final child:Child;
  final onClick:EventListener = null;

  public function build() {
    return new Html<'a'>({
      className: selected.map(selected -> ClassName.ofArray([
        'spruce-menu-link',
        baseStyles,
        styles,
        selected ? selectedStyles : null
      ])),
      href: kind.map(kind -> switch kind {
        case Link(url): url;
        default: '#'; // Required to allow tabbing.
      }),
      role: kind.map(kind -> switch kind {
        case Action(_): 'button';
        default: null;
      }),
      onClick: kind.map(kind -> switch kind {
        case Action(action): 
          e -> {
            e.preventDefault();
            if (onClick != null) onClick(e);
            action();
          }
        case Link(_) if (onClick != null): onClick;
        default: null;
      }),
      children: [ child ]
    });
  } 
}