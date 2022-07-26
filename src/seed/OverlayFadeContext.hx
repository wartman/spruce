package seed;

import seed.controller.VisibilityController;

class OverlayFadeContext extends OverlayContext {
  final visibility:VisibilityController;

  public function new(props) {
    visibility = new VisibilityController({
      getEl: props.getEl,
      animateShow: el -> {
        el.style.opacity = '1';
      },
      animateHide: el -> {
        el.style.opacity = '0';
      },
      beforeShow: props.beforeShow,
      onShow: props.onShow,
      onHide: props.onHide
    });
    visibility.activate();
  }

  public function hide() {
    visibility.hide();
  }

  public function show() {}

  public function dispose() {
    visibility.dispose();
  }
}