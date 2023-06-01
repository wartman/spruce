package spruce.dropdown;

import eg.DropdownContext;
import eg.DropdownItem;
import spruce.core.*;
import spruce.menu.MenuLink;

class DropdownMenuLink extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;
  final kind:MenuLinkKind;
  final closeOnClick:Bool = true;

  public function build() {
    var link = new MenuLink({
      styles: Breeze.compose(
        'spruce-dropdown-menu-link',
        Spacing.pad('x', 3),
        Spacing.pad('y', 0),
        Flex.alignItems('center'),
        Typography.textVerticalAlign('middle'),
        InputHeightStyle.Md.toStyle(),
        BorderRadiusStyle.Small.toStyle(),
        Modifier.hover(
          Background.color('primary', 600),
          Typography.textColor('neutral', 0)
        ),
        styles
      ),
      onClick: if (closeOnClick) _ -> {
        DropdownContext.from(this).close();
      } else null,
      kind: kind,
      child: child
    });

    return new DropdownItem({ child: link });
  }
}
