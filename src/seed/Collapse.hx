package seed;

import pine.*;
import pine.html.*;

using Nuke;

// @todo: This was one of the first components I made for this
// library -- it no longer fits with the way the rest of the
// app works.
// @todo: Make the transition speed configurable.
class Collapse extends ObserverComponent {
  @prop final toggle:(toggle:()->Void, collapsed:Bool)->HtmlChild;
  @prop final children:Array<HtmlChild>;
  @track var collapsed:Bool = false;

  #if (js && !nodeJs)
    override function init(context:InitContext) {
      var controller = new CollapseController(context);
      Effect.on(context).add(() -> controller.toggle(collapsed));
    }
  #end

  public function render(context:Context) {
    return new Box({
      styles: 'seed-collapse',
      children: [
        // @todo: Handle accessability issues: https://getbootstrap.com/docs/5.2/components/collapse/#accessibility
        toggle(() -> collapsed = !collapsed, collapsed),
        new Box({
          styles: Css.atoms({
            overflow: 'hidden',
            height: 0.px(),
            transition: [ 'height', 300.ms() ],
          }).with('seed-collapse-content'),
          children: children
        })
      ]
    });
  }
}

// @todo: This might make more sense if we wrap it in a Provider like we
// do with ModalContext? It feels a bit inconsitant now.
//
// At the very least we should do that for CollapseGroups

#if (js && !nodeJs)
  // @todo: Some of the Transition and Animation stuff in here could be
  // moved into an AnimationController class! Listening for transition/animation
  // ends is super useful.
  private class CollapseController implements Disposable {
    final context:InitContext;
    var onReady:Null<()->Void>;

    public function new(context) {
      this.context = context;
      context.addDisposable(this);
      Process.defer(() -> {
        getEl().addEventListener('transitionend', dequeue);
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

    function getEl() {
      var parent:js.html.Element = context.getObject();
      var el = parent.querySelector('.seed-collapse-content');
      return el;
    }

    function dequeue() {
      if (onReady != null) onReady();
    }

    public function dispose() { 
      if (onReady != null) onReady = null;

      var el = getEl();
      if (el != null) {
        el.removeEventListener('transitionend', dequeue);
      }
    }
  }
#end
