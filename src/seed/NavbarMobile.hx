package seed;

import pine.*;
import pine.html.*;
import seed.style.*;

using Nuke;

class NavbarMobile extends ObserverComponent {
  @prop final children:HtmlChildren;
  @prop final sidebarTitle:String = null;
  @track var isOpen:Bool = false;

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