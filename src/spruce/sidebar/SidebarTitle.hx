package spruce.sidebar;

import pine.*;
import pine.html.*;

class SidebarTitle extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;

  public function build() {
    return new Html<'h5'>({
      className: Breeze.compose(
        'spruce-sidebar-title',
        styles,
        Spacing.margin('bottom', 0)
      ),
      children: [ child ]
    });
  }
}
