package spruce.animation;

import pine.*;
import spruce.core.*;

#if (js && !nodejs)
import js.html.Element as DomElement;
import js.html.Animation;

using spruce.animation.DomAnimationTools;
#end

class Animated extends HookComponent {
  @prop public final dontAnimateInitial:Bool = false;
  @prop public final createKeyframes:KeyframeFactory;
  @prop public final duration:Int;
  @prop public final onFinished:Null<(context:Context)->Void>;

  public function createElement():Element {
    return new AnimatedElement(this);
  }
}

class AnimatedElement extends HookElement<Animated> {
  function onUpdate(previousComponent:Null<Component>) {
    #if (js && !nodejs)
    if (previousComponent == null || component != previousComponent) {
      registerAnimation(previousComponent == null);
    }
    #end
  }

  function performDispose() {
    #if (js && !nodejs)
    if (currentAnimation != null) {
      currentAnimation.cancel();
      currentAnimation = null;
    }
    #end
  }

  #if (js && !nodejs)
  var currentAnimation:Null<Animation> = null;

  function registerAnimation(first:Bool = false) {
    if (currentAnimation != null) currentAnimation.cancel();
    
    var el:DomElement = getObject();
    var duration = first && hook.dontAnimateInitial ? 0 : hook.duration;
    var keyframes = hook.createKeyframes(this);

    currentAnimation = el.registerAnimations(keyframes, duration, onFinished);
  }

  function onFinished() {
    if (currentAnimation != null) currentAnimation = null;
    if (hook.onFinished != null) hook.onFinished(this);
  }
  #end
}
