package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.PortalContext;
import spruce.modal.ModalContainer;
import spruce.layer.Layer;
import spruce.dom.DomTools;

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
