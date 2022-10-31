package spruce.focus;

import pine.*;
import spruce.core.*;

// @todo: Make this robust. It should return focus to the
// previous item, etc. 

class FocusOn extends HookComponent {
  public function createElement():Element {
    return new FocusOnElement(this);
  }
}

class FocusOnElement extends HookElement<FocusOn> {
  function onUpdate(_) {
    #if (js && !nodejs)
    Process.from(this).defer(() -> {
      var el:js.html.Element = Portal.getObjectMaybeInPortal(this);
      FocusContext.from(this).focus(el);
    });
    #end
  }

  function performDispose() {
    FocusContext.from(this).returnFocus();
  }
}
