package seed;

import pine.*;
import pine.html.*;
import seed.service.*;

using Nuke;

enum SidebarAttachment {
  Left;
  Right;
}

class Sidebar extends ImmutableComponent {
  @prop final attachment:SidebarAttachment = Left;
  @prop final onHide:()->Void;
  @prop final children:HtmlChildren;

  public function render(context:Context):Component {
    return new Portal({
      target: PortalContext.from(context).getTarget(),
      child: new Overlay({
        onShow: () -> DomService.from(context).body.lock(),
        onHide: () -> {
          DomService.from(context).body.unlock();
          onHide();
        },
        createContext: (onShow, onHide, context) -> new SidebarContext({
          attachment: attachment,
          getEl: () -> context.getObject(),
          onShow: onShow,
          onHide: onHide
        }),
        child: new Box({
          onClick: e -> e.stopPropagation(),
          styles: Css.atoms({
            backgroundColor: theme(seed.sidebar.bgColor, theme(seed.color.light)),
            color: theme(seed.sidebar.color, theme(seed.color.dark)),
            overflowX: 'scroll',
            position: 'absolute',
            top: 0,
            bottom: 0,
            width: 250.px(),
            '@media screen and (max-width: 250px)': {
              width: 100.pct()
            }
          }).with([
            'seed-sidebar',
            switch attachment {
              case Left: Css.atoms({ 
                left: (-500).px(),
                transition: [ 'left', 300.ms() ]
              });
              case Right: Css.atoms({ 
                right: (-500).px(),
                transition: [ 'right', 300.ms() ]
              });
            }
          ]),
          children: children
        })
      })
    });
  }
}
