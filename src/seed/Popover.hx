package seed;

import pine.*;
import pine.html.*;
import seed.PortalContext;
import seed.PopoverContext;
import seed.Attachment;

using Nuke;

class Popover extends ImmutableComponent {
  @prop final child:HtmlChild;
  @prop final styles:ClassName = null;
  @prop final v:AttachmentVertical = Top;
  @prop final h:AttachmentHorizontal = Middle;
  @prop final getTarget:()->Null<Dynamic> = () -> null;
  @prop final onHide:()->Void = () -> null;

  public function render(context:Context) {
    var getTarget = () -> {
      var target = getTarget();
      return if (target == null) {
        switch context.findAncestorOfType(ObjectElement) {
          case Some(el): el.getObject();
          case None: throw 'No object found';
        }
      } else {
        target;
      }
    };

    return new PopoverContextProvider({
      create: () -> new PopoverContext({ 
        getTarget: getTarget, 
        v: v, 
        h: h, 
        onHide: onHide 
      }),
      dispose: pop -> pop.dispose(),
      render: _ -> new Portal({
        target: PortalContext.from(context).getTarget(),
        child: new PopoverContainer({
          styles: styles,
          child: child
        })
      })
    });
  }
}
