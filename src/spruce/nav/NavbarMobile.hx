package spruce.nav;

import pine.*;
import spruce.control.*;
import spruce.core.*;
import spruce.icon.Icon;
import spruce.sidebar.*;

using Nuke;

class NavbarMobile extends AutoComponent {
  final sidebarTitle:String = null;
  final body:(context:Component)->Child;
  @:signal final isOpen:Bool = false;

  function build() {
    return new Fragment([
      new ControlGroup({
        styles: Breakpoint.md({ display: [ 'none', '!important' ] }),
        controls: [
          new ControlButton({
            onClick: _ -> isOpen.set(true),
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
      new Show(isOpen, () -> new Sidebar({
        attachment: Left,
        onHide: () -> isOpen.set(false),
        children: [
          new SidebarHeader({
            child: if (sidebarTitle != null) new SidebarTitle({ child: sidebarTitle }) else null
          }),
          new SidebarBody({
            children: new Scope(body)
          })
        ]
      }))
    ]);
  }  
}
