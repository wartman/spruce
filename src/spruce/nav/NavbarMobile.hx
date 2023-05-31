package spruce.nav;

import pine.*;
import spruce.control.*;
import spruce.icon.*;
import spruce.sidebar.*;

class NavbarMobile extends AutoComponent {
  final sidebarTitle:String = null;
  final child:(context:Component)->Child;
  @:signal final isOpen:Bool = false;

  function build() {
    return new Fragment([
      new ControlGroup({
        styles: Breeze.compose(
          Breakpoint.viewport('md', Layout.display('none'))
        ),
        controls: [
          new ControlButton({
            onClick: _ -> isOpen.set(true),
            ariaLabel: 'Open Main Menu',
            child: new Hamburger({
              styles: Breeze.compose(
                Sizing.width(5),
                Sizing.height(5)
              )
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
            children: new Scope(child)
          })
        ]
      }))
    ]);
  }  
}
