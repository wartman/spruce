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
          border: [
            theme(seed.dropdownMenu.border.width, theme(seed.rounded.border.width)), 
            theme(seed.dropdownMenu.border.style, theme(seed.rounded.border.style, 'solid')), 
            theme(seed.dropdownMenu.border.color, theme(seed.rounded.border.color))
          ],
          padding: [
            theme(seed.dropdownMenu.padding.y, theme(seed.rounded.padding.y, theme(seed.box.padding.y))),
            0.px()
          ],
          borderRadius: theme(seed.dropdownMenu.border.radius, theme(seed.rounded.border.radius)),
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
