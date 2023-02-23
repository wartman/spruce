package spruce.sidebar;

import eg.Keyframes;
import eg.Layer;
import eg.PortalContext;
import eg.ScrollLocked;
import pine.*;
import spruce.core.*;

using Nuke;

class Sidebar extends AutoComponent {
  final onHide:()->Void;
  final children:Children;
  final attachment:SidebarAttachment = Left;
  final hideOnEscape:Bool = true;
  
  function render(context:Context) {
    var show = switch attachment {
      case Left: new Keyframes('show:left', context -> [
        { opacity: 0, margin: '0 0 0 -500px' },
        { opacity: 1, margin: 0 }
      ]);
      case Right: new Keyframes('show:right', context -> [
        { opacity: 0, margin: '0 -500px 0 0' },
        { opacity: 1, margin: 0 }
      ]);
    };
    var hide = switch attachment {
      case Left: new Keyframes('hide:left', context -> [
        { opacity: 1, margin: 0 },
        { opacity: 0, margin: '0 0 0 -500px' }
      ]);
      case Right: new Keyframes('hide:right', context -> [
        { opacity: 1, margin: 0 },
        { opacity: 0, margin: '0 -500px 0 0' }
      ]);
    };
    var portal = new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        styles: [
          'spruce-overlay',
          Overlay.baseStyles
        ],
        onHide: onHide,
        hideOnEscape: hideOnEscape,
        showAnimation: show,
        hideAnimation: hide,
        child: new SidebarPanel({
          children: children,
          attachment: attachment
        })
      })
    });
    return new ScrollLocked({ child: portal });
  }
}
