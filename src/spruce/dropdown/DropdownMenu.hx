package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.menu.*;
import spruce.core.Layout;
import spruce.paper.Paper;

using Nuke;
using pine.Cast;

class DropdownMenu extends ImmutableComponent {
  @prop final children:HtmlChildren; 
  @prop final layout:Layout = Vertical;

  public function render(context:Context) {
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

    #if (js && !nodejs)
    // @todo: This feels super hacky, especially if we're using dropdowns
    // outside of DropdownButtons.
    var width = switch context.queryAncestors(el -> el.getComponent().getComponentType() == DropdownButton.componentType) {
      case Some(el): el.getObject().as(js.html.Element).offsetWidth.px();
      case None: 'auto';
    }
    #else
    var width = 'auto';
    #end

    return new Paper({
      styles: [
        Css.atoms({ 
          width: width,
          maxWidth: 100.vw(),
          padding: [ theme(spruce.paper.padding.y), theme(spruce.paper.padding.x) ]
        }),
      ],
      onClick: e -> e.stopPropagation(),
      children: body
    });
  }
}

