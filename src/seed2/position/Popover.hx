package seed2.position;

import pine.*;
import pine.html.*;
import seed2.core.*;
import seed2.core.Attachment;

using Nuke;

class Popover extends ImmutableComponent {
  @prop final child:HtmlChild;
  @prop final styles:ClassName = null;
  @prop final attachment:Attachment;
  @prop final getTarget:Null<()->Dynamic> = null;

  function render(context:Context) {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Positioned({
        getTarget: getTarget != null 
          ? getTarget 
          : () -> switch context.findAncestorOfType(ObjectElement) {
            case Some(parent): parent.getObject();
            case None: throw 'No parent object';
          },
        attachment: attachment,
        child: child
      })
    });
  }
}
