package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.*;
import spruce.core.Layout;
import spruce.panel.Panel;
import eg.DropdownItem;

using Nuke;

class DropdownMenu extends AutoComponent {
  final children:HtmlChildren; 
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
    // @todo: This feels super hacky, especially if we're using dropdowns
    // outside of DropdownButtons.
    var width = switch context.queryAncestors().ofType(DropdownButton) {
      case Some(el): (el.getObject():js.html.Element).offsetWidth.px();
      case None: 'auto';
    }
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
