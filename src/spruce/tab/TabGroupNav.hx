package spruce.tab;

import pine.*;
import pine.html.*;
import spruce.menu.Menu;
import spruce.core.*;

using Nuke;

class TabGroupNav extends ImmutableComponent {
  @prop final children:HtmlChildren;
  @prop final spacingBottom:Spacing = Medium;

  function render(context:Context) {
    var tabs = TabContext.from(context);
  
    return new Box({
      tag: Nav,
      styles: [
        Css.atoms({ 
          width: 100.pct()
        }),
        spacingBottom.toBottomMargin(),
        getTabSTyle(tabs)
      ],
      children: new Menu({
        layout: Horizontal,
        spacing: switch tabs.variant {
          case Underline: None;
          default: Small;
        },
        children: children
      })
    });
  }

  function getTabSTyle(tabs:TabContext) {
    return switch tabs.variant {
      case Underline: 
        Css.atoms({
          borderBottom: [ 2.px(), 'solid', theme(spruce.color.neutral300) ],
          marginBottom: theme(spruce.spacing.small)
        });
      default: null;
    }
  }
}
