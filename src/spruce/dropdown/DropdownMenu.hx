package spruce.dropdown;

import eg.DropdownToggle;
import spruce.core.*;
import spruce.menu.*;
import spruce.panel.Panel;

class DropdownMenu extends AutoComponent {
  final children:Children; 
  final layout:LayoutStyle = Vertical;

  public function build() {
    var body = new Menu({
      layout: layout,
      spacing: None,
      role: 'menu',
      onClick: e -> e.stopPropagation(),
      children: children
    });

    #if (js && !nodejs)
    var width = findAncestorOfType(Dropdown)
      .flatMap(component -> component.findChildOfType(DropdownToggle, true))
      .map(component -> (component.getObject():js.html.Element).offsetWidth + 'px')
      .or('auto');
    onMount(() -> {
      var el:js.html.Element = getObject();
      el.style.minWidth = width;
    });
    #end

    return new Panel({
      styles: Breeze.compose(
        'spruce-dropdown-menu',
        Sizing.width('max', 'screen')
      ),
      shadow: Medium,
      onClick: e -> e.stopPropagation(),
      children: body
    });
  }
}
