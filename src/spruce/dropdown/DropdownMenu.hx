package spruce.dropdown;

import eg.DropdownToggle;
import pine.*;
import spruce.core.Layout;
import spruce.menu.*;
import spruce.panel.Panel;

using Nuke;
using pine.core.OptionTools;

class DropdownMenu extends AutoComponent {
  final children:Children; 
  final layout:Layout = Vertical;

  public function render(context:Context) {
    var body = new Menu({
      layout: layout,
      spacing: None,
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

    #if (js && !nodejs)
    var width = context
      .queryAncestors()
      .ofType(Dropdown)
      .map(element -> element.queryChildren().findOfType(DropdownToggle, true))
      .map(element -> Some((element.getObject():js.html.Element).offsetWidth.px()))
      .or('auto');
    #else
    var width = 'auto';
    #end

    return new Panel({
      styles: [
        Css.atoms({ 
          minWidth: width,
          maxWidth: 100.vw()
        })
      ],
      onClick: e -> e.stopPropagation(),
      children: body
    });
  }
}
