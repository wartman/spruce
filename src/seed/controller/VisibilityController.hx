package seed.controller;

import pine.Process;

class VisibilityController {
  final getEl:()->js.html.Element;
  final onHide:()->Void;
  final onShow:()->Void;
  final animateShow:(el:js.html.Element)->Void;
  final animateHide:(el:js.html.Element)->Void;
  var isTransitioning:Bool = false;

  public function new(props) {
    this.getEl = props.getEl;
    this.onHide = props.onHide;
    this.onShow = props.onShow;
    this.animateShow = props.animateShow;
    this.animateHide = props.animateHide;
  }

  public function activate() {
    Process.defer(show);
  }

  public function show() {
    isTransitioning = true;
    var el = getEl();
    el.addEventListener('transitionend', finishShow);
    animateShow(el);
  }

  function finishShow() {
    getEl().removeEventListener('transitionend', finishShow);
    isTransitioning = false;
    if (onShow != null) onShow();
  }

  public function hide() {
    if (isTransitioning) return;
    isTransitioning = true;

    var el = getEl();
    
    el.addEventListener('transitionend', finishHide);
    animateHide(el);
  }

  function finishHide() {
    getEl().removeEventListener('transitionend', finishHide);
    isTransitioning = false;
    onHide();
  }

  public function dispose() {
    getEl().removeEventListener('transitionend', finishHide);
  }
}
