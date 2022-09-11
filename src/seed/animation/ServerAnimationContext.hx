package seed.animation;

import seed.animation.AnimationContext.ExpandDirection;

class ServerAnimationContext extends AnimationContext {
  public function fadeOut(object:Dynamic, speed:Int, ?onFinished:() -> Void) {}

  public function fadeIn(object:Dynamic, speed:Int, ?onFinished:() -> Void) {}

  public function expand(object:Dynamic, dir:ExpandDirection, speed:Int, ?onFinished:() -> Void) {}
}
