package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.MenuLink;
import eg.DropdownContext;
import eg.DropdownItem;

using Nuke;

class DropdownMenuLink extends AutoComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final kind:MenuLinkKind;
  @prop final closeOnClick:Bool = true;

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
