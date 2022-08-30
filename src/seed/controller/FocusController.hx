package seed.controller;

import pine.Context;
import js.html.Element;

class FocusController {
  public function new() {}

  public function giveFocus(context:Context) {
    // @todo: We'll have something much more complex than this.
    var el:Element = context.getObject();
    trace(el);
    el.focus();
  }
}