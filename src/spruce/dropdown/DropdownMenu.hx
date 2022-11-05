package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.*;
import spruce.core.Layout;
import spruce.paper.Paper;

using Nuke;

class DropdownMenu extends ImmutableComponent {
  @prop final children:HtmlChildren; 
  @prop final layout:Layout = Vertical;

  public function render(context:Context) {
    // @todo: We need to be able to tab through these
    // @todo: We need to focus on the first item when shown.
    var body = new Menu({
      layout: layout,
      role: 'menu',
      styles: [
        Theme.define({
          spruce: {
            grid: {
              gap: theme(spruce.dropdownMenu.grid.gap, 0)
            }
          }
        })
      ],
      onClick: e -> e.stopPropagation(),
      children: children
    });

    return new Paper({
      // styles: [],
      onClick: e -> e.stopPropagation(),
      children: body
    });
  }
}

