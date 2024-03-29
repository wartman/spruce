package spruce.sidebar;

import pine.*;
import spruce.paper.Paper;

using Nuke;

class SidebarPanel extends AutoComponent {
  final children:Children;
  final attachment:SidebarAttachment;

  public function build() {
    return new Paper({
      borderRadius: None,
      onClick: e -> e.stopPropagation(),
      styles: [
        Css.atoms({
          position: 'absolute',
          top: 0,
          minHeight: 100.vh(),
          width: 250.px(), // @todo: make configurable?
          '@media screen and (max-width: 250px)': {
            width: 100.vw()
          }
        }),
        switch attachment {
          case Left: Css.atoms({ left: 0 });
          case Right: Css.atoms({ right: 0 });
        },
        'spruce-sidebar'
      ],
      focusable: true,
      role: 'dialog',
      children: children
    });
  }
}
