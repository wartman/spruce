package seed;

import pine.*;
import pine.html.*;
import seed.MenuLink;

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
          theme(seed.dropdownMenu.padding.x, theme(seed.rounded.padding.x, theme(seed.box.padding.x)))
        ],
        ':hover': {
          backgroundColor: theme(seed.dropdownMenu.hilightBgColor),
          color: theme(seed.dropdownMenu.hilightColor, theme(seed.dropdownMenu.color))
        }
      }).with([
        'seed-dropdown-menu-link',
        styles
      ]),
      kind: kind,
      child: child
    });
  }
}
