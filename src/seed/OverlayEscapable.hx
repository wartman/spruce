package seed;

import pine.*;
#if (js && !nodejs)
  import seed.controller.KeyboardController;
#end

class OverlayEscapable extends ImmutableComponent {
  @prop final container:OverlayContainer;

  public function render(context:Context) {
    #if (js && !nodejs)
      return new Provider<KeyboardController>({
        create: () -> new KeyboardController(key -> {
          switch key {
            case Escape:
              OverlayContext.from(context).hide();
            default:
          }
        }),
        dispose: controller -> controller.dispose(),
        render: _ -> container
      });
    #else
      return container;
    #end
  }
}
