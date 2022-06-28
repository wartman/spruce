package seed;

import pine.*;

class OverlayEscapable extends ImmutableComponent {
  @prop final container:OverlayContainer;

  #if (js && !nodejs)
    override function init(context:InitContext) {
      var controller = new seed.controller.KeyboardController(key -> {
        switch key {
          case Escape:
            OverlayContext.from(context).hide();
          default:
        }
      });
      Cleanup.on(context).add(controller);
    }
  #end

  public function render(context:Context) {
    return container;
  }
}
