package seed;

import pine.*;
import seed.animation.AnimationContext;

typedef CollapseContextProvider = Provider<CollapseContext>;

class CollapseContext implements Disposable {
  public static function from(context:Context) {
    return switch CollapseContextProvider.maybeFrom(context) {
      case Some(collapse): collapse;
      case None: throw 'No collapse context was found';
    }
  }

  public final collapsed:State<Bool>;
  final animation:AnimationContext;
  final speed:Int;
  var obs:Null<Observer> = null;

  public function new(props) {
    this.collapsed = new State(props.collapsed);
    this.animation = props.animation;
    this.speed = props.speed;
  }

  public function activate(getEl:()->Dynamic) {
    Debug.assert(obs == null);
    
    var first = true;
    obs = new Observer(() -> {
      var dir = collapsed.get();
      if (!first) animation.expand(getEl(), switch dir {
        case true: Up;
        default: Down;
      }, speed);
      first = false;
    });
  }

  public function show() {
    collapsed.set(false);
  }

  public function hide() {
    collapsed.set(true);
  }

  public function toggle(collapsed:Bool) {
    if (collapsed) hide() else show();
  }

  public function dispose() {
    if (obs != null) {
      obs.dispose();
      obs = null;
    }
  }
}
