package seed2.layer;

import pine.*;
import pine.html.*;

using Nuke;

class Layer extends ImmutableComponent {
  @prop final beforeShow:()->Void = null;
  @prop final onShow:()->Void = null;
  @prop final onHide:()->Void;
  @prop final hideOnClick:Bool = true;
  @prop final hideOnEscape:Bool = true;
  @prop final child:HtmlChild;
  @prop final createContext:LayerContextFactory = LayerContext.createDefault;

  override function init(context:InitContext) {
    if (beforeShow != null) beforeShow();
  }

  public function render(context:Context):Component {
    return new LayerContextProvider({
      create: () -> createContext(onShow, onHide),
      dispose: overlay -> overlay.dispose(),
      render: overlay -> new LayerContainer({
        hideOnClick: hideOnClick,
        child: child
      })
    });
  }
}
