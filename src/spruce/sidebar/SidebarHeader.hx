package spruce.sidebar;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.control.*;
import spruce.icon.Icon;
import spruce.layer.LayerContext;

using Nuke;

class SidebarHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild = null;
  
  public function render(context:Context) {
    return new Box({
      tag: Header,
      styles: Css.atoms({
        padding: [
          theme(spruce.sidebar.padding.y, theme(spruce.box.padding.y)),
          theme(spruce.sidebar.padding.x, theme(spruce.box.padding.x))
        ],
      }).with([
        'spruce-sidebar-header',
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