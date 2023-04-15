package spruce.sidebar;

import eg.LayerContext;
import pine.*;
import spruce.control.*;
import spruce.core.*;
import spruce.icon.Icon;

using Nuke;

class SidebarHeader extends AutoComponent {
  final styles:ClassName = null;
  final child:Child = null;
  
  public function build() {
    return new Box({
      tag: Header,
      styles: Css.atoms({
        padding: theme(spruce.spacing.medium),
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
              onClick: _ -> LayerContext.from(this).hide(),
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
