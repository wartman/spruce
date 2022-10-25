package spruce.animation;

import pine.*;

#if (js && !nodejs)
import js.html.Element as DomElement;
import js.html.Animation;

using spruce.animation.DomAnimationTools;
#end

class Animated extends Component {
  static final type = new UniqueId();
  
  public final dontAnimateInitial:Bool;
  public final createKeyframes:KeyframeFactory;
  public final child:Component;
  public final duration:Int;
  public final onFinished:Null<(context:Context)->Void>;

  public function new(props:{
    createKeyframes:KeyframeFactory,
    child:Component,
    duration:Int,
    ?dontAnimateInitial:Bool,
    ?onFinished:(context:Context)->Void,
    ?key:Key
  }) {
    super(props.key);
    this.createKeyframes = props.createKeyframes;
    this.child = props.child;
    this.duration = props.duration;
    this.onFinished = props.onFinished;
    this.dontAnimateInitial = props.dontAnimateInitial == true;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new AnimatedElement(this);
  }
}

class AnimatedElement extends Element {
  var child:Null<Element> = null;
  var animated(get, never):Animated;
  inline function get_animated():Animated return getComponent();

  function performHydrate(cursor:HydrationCursor) {
    Debug.assert(!(animated.child is Fragment), 'Fragments will not work in Animated components');
    child = hydrateElementForComponent(cursor, animated.child, slot);
    registerAnimation(true);
  }

  function performBuild(previousComponent:Null<Component>) {
    Debug.assert(!(animated.child is Fragment), 'Fragments will not work in Animated components');
    child = updateChild(child, animated.child, slot);
    #if (js && !nodejs)
    if (component != previousComponent) {
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

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }

  #if (js && !nodejs)
  var currentAnimation:Null<Animation> = null;

  function registerAnimation(first:Bool = false) {
    if (currentAnimation != null) currentAnimation.cancel();
    
    var el:DomElement = getObject();
    var duration = first && animated.dontAnimateInitial ? 0 : animated.duration;
    var keyframes = animated.createKeyframes(this);

    currentAnimation = el.registerAnimations(keyframes, duration, onFinished);
  }

  function onFinished() {
    if (currentAnimation != null) currentAnimation = null;
    if (animated.onFinished != null) animated.onFinished(this);
  }
  #end
}
