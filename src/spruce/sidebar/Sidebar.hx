package spruce.sidebar;

import pine.*;
import pine.html.*;
import spruce.core.*;
import eg.Keyframes;
import eg.internal.DomTools;
import eg.Layer;
import eg.PortalContext;

using Nuke;

class Sidebar extends AutoComponent {
  final onHide:()->Void;
  final children:HtmlChildren;
  final attachment:SidebarAttachment = Left;
  final hideOnEscape:Bool = true;
  
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
        styles: [
          'spruce-overlay',
          Overlay.baseStyles
        ],
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
        child: new SidebarPanel({
          children: children,
          attachment: attachment
        })
      })
    });
  }
}
