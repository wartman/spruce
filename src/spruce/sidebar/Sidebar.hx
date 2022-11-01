package spruce.sidebar;

import pine.*;
import pine.html.*;
import spruce.animation.Keyframes;
import spruce.core.PortalContext;
import spruce.dom.DomTools;
import spruce.layer.*;

using Nuke;

class Sidebar extends ImmutableComponent {
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final attachment:SidebarAttachment = Left;
  @prop final hideOnEscape:Bool = true;
  
  function render(context:Context) {
    var animation:Keyframes = switch attachment {
      case Left: [
        { opacity: 0, margin: '0 0 0 -500px' },
        { opacity: 1, margin: 0 }
      ];
      case Right: [
        { opacity: 0, margin: '0 -500px 0 0' },
        { opacity: 1, margin: 0 }
      ];
    };
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        hideOnEscape: hideOnEscape,
        showAnimation: animation,
        hideAnimation: animation.invert(),
        beforeShow: () -> {
          lockBody();
        },
        onHide: () -> {
          unlockBody();
          onHide();
        },
        child: new LayerTarget({
          child: new SidebarPanel({
            children: children,
            attachment: attachment
          })
        })
      })
    });
  }
}
