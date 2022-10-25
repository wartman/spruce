package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.MenuLink;

using Nuke;

class DropdownMenuLink extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final kind:MenuLinkKind;

  public function render(context:Context) {
    return new MenuLink({
      styles: Css.atoms({
        padding: [
          0.px(),
          theme(spruce.dropdownMenu.padding.x)
        ],
        ':hover': {
          backgroundColor: theme(spruce.dropdownMenu.hilightBgColor),
          color: theme(spruce.dropdownMenu.hilightColor, theme(spruce.dropdownMenu.color))
        }
      }).with([
        'spruce-dropdown-menu-link',
        styles
      ]),
      kind: kind,
      child: child
    });
  }
}
