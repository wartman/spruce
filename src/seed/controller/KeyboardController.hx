package seed.controller;

import pine.*;

enum abstract KeyInput(String) from String to String {
  final ArrowLeft;
  final ArrowRight;
  final ArrowUp;
  final ArrowDown;
  final Escape;
}

final keyInputs:Array<KeyInput> = [ ArrowLeft, ArrowRight, ArrowUp, ArrowDown, Escape ];

class KeyboardController implements Disposable {
  final handler:(key:KeyInput) -> Void;

  public function new(handler) {
    this.handler = handler;
    js.Browser.document.addEventListener('keyup', process);
  }
  
  public function dispose() {
    js.Browser.document.removeEventListener('keyup', process);
  }

  function process(e:js.html.Event) {
    var event:js.html.KeyboardEvent = cast e;
    
    if (event.getModifierState('Alt') || !keyInputs.contains(event.key)) return;

    handler(event.key);
  }
}
