package seed.animation;

import pine.*;

enum ExpandDirection {
  Down;
  Up;
}

// typedef AnimationContextProvdider = Provider<AnimationContext>;
final impl = #if (js && !nodejs) new DomAnimationContext(); #else new ServerAnimationContext(); #end

abstract class AnimationContext {
  public static function from(context:Context) {
    return impl;
  }

  public function new() {}

  abstract public function fadeOut(object:Dynamic, speed:Int, ?onFinished:()->Void):Void;
  
  abstract public function fadeIn(object:Dynamic, speed:Int, ?onFinished:()->Void):Void;
  
  abstract public function expand(object:Dynamic, dir:ExpandDirection, speed:Int, ?onFinished:()->Void):Void;
}
