package spruce.sidebar;

import spruce.focus.FocusOn;
import pine.*;
import pine.html.HtmlChildren;
import spruce.core.Box;

using Nuke;

class SidebarPanel extends ImmutableComponent {
  @prop final children:HtmlChildren;
  @prop final attachment:SidebarAttachment;

  public function render(context:Context) {
    var panel = new Box({
      onclick: e -> e.stopPropagation(),
      styles: [
        Css.atoms({
          backgroundColor: theme(spruce.sidebar.bgColor, theme(spruce.color.light)),
          color: theme(spruce.sidebar.color, theme(spruce.color.dark)),
          overflowY: 'scroll',
          position: 'absolute',
          top: 0,
          bottom: 0,
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
      ariaModal: 'true',
      tabIndex: -1,
      role: 'dialog',
      children: children
    });
    
    return new FocusOn({ child: panel });
  }
}
