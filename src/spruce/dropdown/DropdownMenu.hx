package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.*;
import spruce.core.Layout;

using Nuke;

class DropdownMenu extends ImmutableComponent {
  @prop final children:HtmlChildren; 
  @prop final layout:Layout = Vertical;

  public function render(context:Context) {
    // @todo: We need to be able to tab through these
    return new Menu({
      layout: layout,
      styles: [
        Css.atoms({
          border: theme(spruce.dropdownMenu.border.appearance),
          borderRadius: theme(spruce.dropdownMenu.border.radius),
          padding: [ theme(spruce.dropdownMenu.padding.y), 0.px() ],
          margin: theme(spruce.dropdownMenu.margin, 0),
          backgroundColor: theme(spruce.dropdownMenu.bgColor),
          minWidth: theme(spruce.dropdownMenu.minWidth, 10.rem()),
          color: theme(spruce.dropdownMenu.color)
        }),
        Theme.define({
          spruce: {
            grid: {
              gap: theme(spruce.dropdownMenu.grid.gap, 0)
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

