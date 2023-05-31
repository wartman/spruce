package spruce.sidebar;

import eg.LayerContext;
import pine.*;
import spruce.control.*;
import spruce.box.Box;
import spruce.core.*;
import spruce.icon.*;

class SidebarHeader extends AutoComponent {
  final styles:ClassName = null;
  final child:Child = null;
  
  public function build() {
    return new Box({
      tag: Header,
      styles: Breeze.compose(
        'spruce-sidebar-header'
      ),
      padding: SpacingStyle.Medium,
      layout: LayoutStyle.Horizontal,
      children: [
        new Box({
          styles: Spacing.margin('right', 'auto'),
          children: [ child ]
        }),
        new ControlGroup({
          controls: [
            new ControlButton({
              onClick: _ -> LayerContext.from(this).hide(),
              ariaLabel: 'Close',
              child: new Close({
                styles: Breeze.compose(
                  Sizing.width(5),
                  Sizing.height(5)
                )
              })
            })
          ]
        })
      ]
    });
  }
}
