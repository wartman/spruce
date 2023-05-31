package spruce.tab;

import pine.*;
import spruce.box.Box;
import spruce.core.*;
import spruce.menu.Menu;

class TabGroupNav extends AutoComponent {
  final children:Children;
  final spacingBottom:SpacingStyle = Medium;

  function build() {
    var tabs = TabContext.from(this);
  
    return new Box({
      tag: Nav,
      styles: Breeze.compose(
        Sizing.width('full'),
        spacingBottom.toBottomMargin(),
        getTabSTyle(tabs)
      ),
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
        Breeze.compose(
          Border.width('bottom', '2px'),
          Border.style('solid'),
          Border.color('neutral', 300),
          // Border.style('bottom', 'solid'),
          // Border.color('bottom', 'neutral', 300),
          Spacing.margin('bottom', '.75rem')
        );
        // Css.atoms({
        //   borderBottom: [ 2.px(), 'solid', theme(spruce.color.neutral300) ],
        //   marginBottom: theme(spruce.spacing.small)
        // });
      default: null;
    }
  }
}
