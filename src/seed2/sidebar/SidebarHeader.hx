package seed2.sidebar;

import pine.*;
import pine.html.*;
import seed2.core.*;
import seed2.control.*;
import seed2.icon.Icon;
import seed2.layer.LayerContext;

using Nuke;

class SidebarHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild = null;
  
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
        Layout.Horizontal.toStyle(),
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
              onClick: _ -> LayerContext.from(context).hide(),
              ariaLabel: 'Close',
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
