package seed;

import pine.*;

typedef CollapseContextProvider = Provider<CollapseContext>;

class CollapseContext implements Disposable {
  public static function from(context:Context) {
    return CollapseContextProvider.from(context);
  }

  public final collapsed:State<Bool> = new State(true);
  var obs:Null<Observer> = null;
  var controller:Null<CollapseController> = null;

  public function new() {}

  public function activate(getEl:()->Dynamic) {
    Debug.assert(controller == null);
    controller = new CollapseController(getEl);
    Process.defer(() -> {
      obs = new Observer(() -> controller.toggle(collapsed.get()));
    });
  }

  public function show() {
    if (controller == null) return;
    collapsed.set(false);
  }

  public function hide() {
    if (controller == null) return;
    collapsed.set(true);
  }


  public function toggle(collapsed:Bool) {
    if (collapsed) hide() else show();
  }

  public function dispose() {
    if (controller != null) {
      controller.dispose();
      controller = null;
    }
    if (obs != null) {
      obs.dispose();
      obs = null;
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

    if (!collapsed) {
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
