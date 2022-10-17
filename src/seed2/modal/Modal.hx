package seed2.modal;

import pine.*;
import pine.html.*;
import seed2.core.PortalContext;
import seed2.modal.ModalContainer;
import seed2.layer.Layer;

using Nuke;

class Modal extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;
  @prop final size:ModalContainerSize = Md;
  @prop final hideOnEscape:Bool = true;

  public function render(context:Context):Component {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Layer({
        beforeShow: () -> {
          // DomService.from(context).body.lock();
        },
        onShow: () -> {
          // @todo: give the modal focus
        },
        onHide: () -> {
          // DomService.from(context).body.unlock();
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
