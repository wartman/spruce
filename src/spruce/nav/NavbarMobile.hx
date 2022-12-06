package spruce.nav;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.control.*;
import spruce.icon.Icon;
import spruce.sidebar.*;

using Nuke;

class NavbarMobile extends AutoComponent {
  final children:HtmlChildren;
  final sidebarTitle:String = null;
  var isOpen:Bool = false;

  function render(context:Context) {
    return new Fragment({
      children: [
        new ControlGroup({
          styles: Breakpoint.md({ display: [ 'none', '!important' ] }),
          controls: [
            new ControlButton({
              onClick: _ -> isOpen = true,
              ariaLabel: 'Open Main Menu',
              child: new Icon({
                // @todo: Replace with Small, Medium and Large for icon size
                styles: Css.atoms({
                  height: 2.em(),
                  width: 2.em()
                }),
                kind: Hamburger
              })
            })
          ]
        }),
        if (isOpen)
          new Sidebar({
            attachment: Left,
            onHide: () -> isOpen = false,
            children: [
              new SidebarHeader({
                child: if (sidebarTitle != null) new SidebarTitle({ child: sidebarTitle }) else null
              }),
              new SidebarBody({
                children: children
              })
            ]
          })
        else
          null
      ]
    });
  }  
}
