package seed;

import seed.controller.VisibilityController;

class OverlayFadeContext extends OverlayContext {
  var visibility:Null<VisibilityController> = null;

  public function activate(getEl:()->Dynamic) {
    visibility = new VisibilityController({
      getEl: getEl,
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
    if (visibility != null) visibility.hide();
  }

  public function show() {}

  public function dispose() {
    if (visibility != null) visibility.dispose();
    visibility = null;
  }
}