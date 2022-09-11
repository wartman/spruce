package seed;

import seed.OverlayContext.OverlayContextProps;
import seed.Sidebar;
import seed.controller.VisibilityController;

class SidebarContext extends OverlayContext {
  var visibility:Null<VisibilityController> = null;
  final attachment:SidebarAttachment;

  public function new(props:{
    attachment:SidebarAttachment,
  } & OverlayContextProps) {
    super(props);
    attachment = props.attachment;
  }

  public function activate(getEl:()->Dynamic) {
    visibility = new VisibilityController({
      getEl: getEl,
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
    if (visibility != null) visibility.show();
  }

  public function hide() {
    if (visibility != null) visibility.hide();
  }

  public function dispose() {
    if (visibility != null) visibility.dispose();
    visibility = null;
  }
}
