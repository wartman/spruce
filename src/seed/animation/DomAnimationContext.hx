package seed.animation;

import js.html.Element;
import seed.animation.AnimationContext;

using Nuke;

private final hasRaf:Bool = js.Syntax.code("typeof window != 'undefined' && 'requestAnimationFrame' in window");

function defer(exec:() -> Void) {
  if (hasRaf)
    js.Syntax.code('window.requestAnimationFrame({0})', time -> {
      js.Browser.window.requestAnimationFrame(_ -> exec());
    }); 
  else
    haxe.Timer.delay(() -> exec(), 10);
}

private inline function onTransitionEnd(el:Element, cb:()->Void) {
  function event(e) {
    cb();
    el.removeEventListener('transitionend', event);
  }
  el.addEventListener('transitionend', event);
}

class DomAnimationContext extends AnimationContext {
  public function fadeOut(object:Dynamic, speed:Int, ?onFinished:() -> Void) {
    var el:Element = object;
    var cls = Css.atoms({ transition: [ 'opacity', speed.ms() ] });
    if (!el.classList.contains(cls)) {
      el.classList.add(cls);
    }

    el.style.opacity = '1';

    defer(() -> {
      if (onFinished != null) onTransitionEnd(el, onFinished);
      el.style.opacity = '0';
    });
  }

  public function fadeIn(object:Dynamic, speed:Int, ?onFinished:() -> Void) {
    var el:Element = object;
    var cls = Css.atoms({ transition: [ 'opacity', speed.ms() ] });
    
    if (!el.classList.contains(cls)) {
      el.classList.add(cls);
    }

    el.style.opacity = '0';

    defer(() -> {
      if (onFinished != null) onTransitionEnd(el, onFinished);
      el.style.opacity = '1';
    });
  }

	public function expand(object:Dynamic, dir:ExpandDirection, speed:Int, ?onFinished:() -> Void) {
    var el:Element = object;
    var cls = Css.atoms({ transition: [ 'height', speed.ms() ] });
    
    if (!el.classList.contains(cls)) {
      el.classList.add(cls);
    }

    switch dir {
      case Down:
        var height = el.scrollHeight;
        el.style.height = '${height}px';
        if (onFinished != null) onTransitionEnd(el, onFinished);
        onTransitionEnd(el, () -> {
          el.style.height = 'auto';
        });
      case Up:
        var height = el.scrollHeight;
        el.style.height = '${height}px';
        defer(() -> {
          if (onFinished != null) onTransitionEnd(el, onFinished);
          el.style.height = '0px';
        });
    }
  }
}
