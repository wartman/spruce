package seed;

import pine.*;
import pine.html.*;
import seed.OverlayContext;

using Nuke;

typedef OverlayContextFactory = (?beforeShow:()->Void, onShow:()->Void, onHide:()->Void, context:Context) -> OverlayContext;

class Overlay extends ImmutableComponent {
  @prop final beforeShow:()->Void = null;
  @prop final onShow:()->Void = null;
  @prop final onHide:()->Void;
  @prop final hideOnClick:Bool = true;
  @prop final hideOnEscape:Bool = true;
  @prop final child:HtmlChild;
  @prop final createContext:OverlayContextFactory = (?beforeShow, onShow, onHide, context) -> new OverlayFadeContext({
    beforeShow: beforeShow,
    onShow: onShow,
    onHide: onHide,
    getEl: () -> context.getObject()
  });

  public function render(context:Context):Component {
    return new OverlayContextProvider({
      create: () -> createContext(beforeShow, onShow, onHide, context),
      dispose: overlay -> overlay.dispose(),
      render: overlay -> {
        var container = new OverlayContainer({
          styles: Css.atoms({
            opacity: 0,
            transition: [ 'opacity', 150.ms() ]
          }),
          hideOnClick: hideOnClick,
          child: child
        });
        if (hideOnEscape) return new OverlayEscapable({ container: container });
        return container;
      }
    });
  }
}
