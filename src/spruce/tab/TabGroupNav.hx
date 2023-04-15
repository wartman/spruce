package spruce.tab;

import pine.*;
import spruce.core.*;
import spruce.menu.Menu;

using Nuke;

class TabGroupNav extends AutoComponent {
  final children:Children;
  final spacingBottom:Spacing = Medium;

  function build() {
    var tabs = TabContext.from(this);
  
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
