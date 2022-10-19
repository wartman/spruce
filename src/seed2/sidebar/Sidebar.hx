package seed2.sidebar;

import pine.*;
import pine.html.*;
import seed2.dom.DomTools;
import seed2.core.PortalContext;
import seed2.layer.*;

using Nuke;

class Sidebar extends ImmutableComponent {
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final attachment:SidebarAttachment = Left;
  
  function render(context:Context) {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        showTransition: [
          { property: 'opacity', start: '0', end: '1' },
          { property: switch attachment {
            case Left: 'margin-left';
            case Right: 'margin-right';
          }, start: '-500px', end: '0' }
        ],
        beforeShow: () -> {
          lockBody();
        },
        onHide: () -> {
          unlockBody();
          onHide();
        },
        child: new SidebarPanel({
          children: children,
          attachment: attachment
        })
      })
    });
  }
}
