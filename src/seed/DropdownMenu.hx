package seed;

import pine.*;
import pine.html.*;

using Nuke;

class DropdownMenu extends ImmutableComponent {
  @prop final children:HtmlChildren; 
  @prop final layout:Layout = Vertical;

  public function render(context:Context) {
    return new Menu({
      layout: layout,
      styles: [
        Css.atoms({
          border: theme(seed.dropdownMenu.border.appearance),
          borderRadius: theme(seed.dropdownMenu.border.radius),
          padding: [ theme(seed.dropdownMenu.padding.y), 0.px() ],
          margin: theme(seed.dropdownMenu.margin, 0),
          backgroundColor: theme(seed.dropdownMenu.bgColor),
          minWidth: theme(seed.dropdownMenu.minWidth, 10.rem()),
          color: theme(seed.dropdownMenu.color)
        }),
        Theme.define({
          seed: {
            grid: {
              gap: theme(seed.dropdownMenu.grid.gap, 0)
            }
          }
        })
      ],
      onClick: e -> {
        e.stopPropagation();
      },
      children: children
    });
  }
}
