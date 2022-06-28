package seed;

import pine.*;

typedef PortalContextProvider = pine.Provider<PortalContext>;

class PortalContext {
  public static function from(context:Context):PortalContext {
    var controller = PortalContextProvider.from(context);
    Debug.alwaysAssert(controller != null, 'No PortalContext was found');
    return controller;
  }

  #if (js && !nodejs)
    final target:js.html.Element;
  #else
    final target:pine.render.Object;
  #end

  public function new(target) {
    this.target = target;
  }

  public function getTarget() {
    return target;
  }
}
