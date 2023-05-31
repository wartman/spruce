package spruce.sidebar;

import pine.*;
import spruce.paper.Paper;

class SidebarPanel extends AutoComponent {
  final children:Children;
  final attachment:SidebarAttachment;

  public function build() {
    return new Paper({
      radius: None,
      onClick: e -> e.stopPropagation(),
      styles: Breeze.compose(
        'spruce-sidebar',
        Breakpoint.markContainer('spruce-sidebar', 'inline-size'),
        Layout.position('absolute'),
        Layout.attach('top', 0),
        Sizing.height('min', 'screen'),
        Sizing.width('screen'),
        Breakpoint.viewport('250px', Sizing.width('250px')), // @todo: make configurable
        switch attachment {
          case Left: Layout.attach('left', 0);
          case Right: Layout.attach('right', 0);
        }
      ),
      focusable: true,
      role: 'dialog',
      children: children
    });
  }
}
