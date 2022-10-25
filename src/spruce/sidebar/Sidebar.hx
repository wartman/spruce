package spruce.sidebar;

import pine.*;
import pine.html.*;
import spruce.dom.DomTools;
import spruce.core.PortalContext;
import spruce.layer.*;

using Nuke;

class Sidebar extends ImmutableComponent {
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final attachment:SidebarAttachment = Left;
  
  function render(context:Context) {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        showAnimation: switch attachment {
          case Left: [
            { opacity: 0, margin: '0 0 0 -500px', offset: 0 },
            { opacity: 1, margin: 0, offset: 1 }
          ];
          case Right: [
            { opacity: 0, margin: '0 -500px 0 0', offset: 0 },
            { opacity: 1, margin: 0, offset: 1 }
          ];
        },
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
