package seed;

import pine.*;
import pine.html.*;
import seed.ModalContainer;
import seed.service.*;

using Nuke;

// todo: Consider removing `children` and replacing it with
// `(context:OverlayContext) -> HtmlChildren` instead? We have
// use `OverlayContext` to hide the modal, so children will
// need access to it anyway.
class Modal extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final size:ModalContainerSize = Md;
  @prop final hideOnEscape:Bool = true;

  public function render(context:Context):Component {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Overlay({
        beforeShow: () -> {
          DomService.from(context).body.lock();
        },
        onShow: () -> {},
        onHide: () -> {
          DomService.from(context).body.unlock();
          onHide();
        },
        child: new ModalContainer({
          size: size,
          styles: styles,
          children: children
        })
      })
    });
  }
}
