package spruce.sidebar;

import pine.*;
import spruce.box.Box;
import spruce.core.SpacingStyle;

class SidebarBody extends AutoComponent {
  final children:Children;

  public function build() {
    return new Box({
      styles: Breeze.compose('spruce-sidebar-body'),
      padding: SpacingStyle.Medium,
      children: children
    });
  }
}
