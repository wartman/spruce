package spruce.menu;

import pine.html.HtmlEvents;

enum MenuLinkKind {
  Link(url:String);
  Action(action:()->Void);
}

class MenuLink extends AutoComponent {
  @:observable final selected:Bool = false;
  @:observable final kind:MenuLinkKind;
  final styles:ClassName = null;
  final selectedStyles:ClassName = null;
  final child:Child;
  final onClick:EventListener = null;

  public function build() {
    return new Html<'a'>({
      className: selected.map(selected -> Breeze.compose(
        'spruce-menu-link',
        styles,
        selected ? selectedStyles : null,
        Layout.display('block'),
        Typography.textDecoration('none'),
        Modifier.focusVisible(
          Border.outlineStyle('solid'),
          Border.outlineOffset('1px'),
          Border.outlineColor('primary', 600)
        )
      )),
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
