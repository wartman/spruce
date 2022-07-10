package seed;

import pine.*;

typedef CollapseContextProvider = Provider<CollapseContext>;

class CollapseContext implements Disposable {
  public static function from(context:Context) {
    return CollapseContextProvider.from(context);
  }

  var controller:Null<CollapseController> = null;

  public function new() {}

  public function activate(getEl:()->Dynamic) {
    Debug.assert(controller == null);
    controller = new CollapseController(getEl);
  }

  public function toggle(collapsed:Bool) {
    if (controller != null) controller.toggle(collapsed);
  }

  public function dispose() {
    if (controller != null) {
      controller.dispose();
      controller = null;
    }
  }
}

private class CollapseController implements Disposable {
  var onReady:Null<()->Void>;
  final getEl:()->Dynamic;

  public function new(getEl) {
    this.getEl = getEl;
    Process.defer(() -> {
      this.getEl().addEventListener('transitionend', onTransitionEnd);
    });
  }

  public function toggle(collapsed:Bool) {
    var el = getEl();

    if (onReady != null) onReady = null;
    if (el == null) return;

    if (collapsed) {
      var height = el.scrollHeight;
      el.style.height = '${height}px';
      onReady = () -> el.style.height = 'auto';
    } else {
      var height = el.scrollHeight;
      el.style.height = '${height}px';
      Process.defer(() -> el.style.height = '0px');
    }
  }

  function onTransitionEnd() {
    if (onReady != null) onReady();
  }

  public function dispose() { 
    if (onReady != null) onReady = null;

    var el = getEl();
    if (el != null) {
      el.removeEventListener('transitionend', onTransitionEnd);
    }
  }
}
