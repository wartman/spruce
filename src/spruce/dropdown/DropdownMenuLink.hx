package spruce.dropdown;

import eg.DropdownContext;
import eg.DropdownItem;
import pine.*;
import spruce.menu.MenuLink;

using Nuke;

class DropdownMenuLink extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;
  final kind:MenuLinkKind;
  final closeOnClick:Bool = true;

  public function render(context:Context) {
    var link = new MenuLink({
      styles: [
        'spruce-dropdown-menu-link',
        Css.atoms({
          padding: [
            0,
            theme(spruce.spacing.small)
          ],
          ':hover': {
            backgroundColor: theme(spruce.color.primary600),
            color: theme(spruce.color.neutral0)
          },
          borderRadius: theme(spruce.border.radius.small),
          height: theme(spruce.input.height.medium),
          lineHeight: theme(spruce.input.height.medium)
        }),
        styles
      ],
      onClick: if (closeOnClick) _ -> {
        DropdownContext.from(context).close();
      } else null,
      kind: kind,
      child: child
    });

    return new DropdownItem({ child: link });
  }
}
