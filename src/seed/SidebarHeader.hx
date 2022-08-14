package seed;

import pine.*;
import pine.html.*;
import seed.style.Stack;

using Nuke;

class SidebarHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  
  public function render(context:Context) {
    return new Box({
      tag: Header,
      styles: Css.atoms({
        padding: [
          theme(seed.sidebar.padding.y, theme(seed.box.padding.y)),
          theme(seed.sidebar.padding.x, theme(seed.box.padding.x))
        ],
      }).with([
        'seed-sidebar-header',
        Stack.horizontal,
        styles
      ]),
      children: [
        new Box({
          styles: Css.atoms({ marginRight: 'auto' }),
          children: [ child ]
        }),
        new ControlGroup({
          controls: [
            new ControlButton({
              onClick: _ -> OverlayContext.from(context).hide(),
              arialLabel: 'Close',
              child: new Icon({ 
                styles: Css.atoms({ width: 2.em(), height: 2.em() }),
                kind: Close 
              })
            })
          ]
        })
      ]
    });
  }
}
