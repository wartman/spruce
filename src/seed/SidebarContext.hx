package seed;

import seed.Sidebar;
import seed.controller.VisibilityController;

class SidebarContext extends OverlayContext {
  final visibility:VisibilityController;

  public function new(props) {
    var attachment:SidebarAttachment = props.attachment;
    visibility = new VisibilityController({
      getEl: props.getEl,
      animateShow: el -> {
        el.style.opacity = '1';
        var sidebar = el.querySelector('.seed-sidebar');
        switch attachment {
          case Left: sidebar.style.left = '0px';
          case Right: sidebar.style.right = '0px';
        }
      },
      animateHide: el -> {
        el.style.opacity = '0';
        var sidebar = el.querySelector('.seed-sidebar');
        switch attachment {
          case Left: sidebar.style.left = '-500px';
          case Right: sidebar.style.right = '-500px';
        }
      },
      beforeShow: props.beforeShow,
      onShow: props.onShow,
      onHide: props.onHide
    });
    visibility.activate();
  }

  public function show() {
    visibility.show();
  }

  public function hide() {
    visibility.hide();
  }

  public function dispose() {
    visibility.dispose();
  }
}
