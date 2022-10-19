package seed2.modal;

import pine.*;
import pine.html.*;
import seed2.core.PortalContext;
import seed2.modal.ModalContainer;
import seed2.layer.Layer;
import seed2.dom.DomTools;

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
          lockBody();
        },
        onShow: () -> {
          // @todo: give the modal focus
        },
        onHide: () -> {
          unlockBody();
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
