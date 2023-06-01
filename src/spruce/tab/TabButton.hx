package spruce.tab;

import spruce.button.Button;
import spruce.core.*;
import spruce.menu.*;
import spruce.menu.MenuLink;

class TabButton extends AutoComponent {
  final tab:Tab;

  public function build() {
    var tabs = TabContext.from(this);

    return new MenuItem({
      child: new MenuLink({
        styles: Breeze.compose(
          'spruce-tab-button',
          tab.buttonStyles,
          Flex.alignItems('center'),
          Interactive.cursor('pointer'),
          getTabStyle(tabs)
        ),
        selectedStyles: [
          'spruce-tab-button--selected',
          getTabSelectedStyle(tabs)
        ],
        selected: tabs.activeTab.map(active -> active == tab),
        kind: MenuLinkKind.Action(() -> tabs.setActiveTab(tab)),
        child: tab.label(this)
      })
    });
  }

  function getTabStyle(tabs:TabContext) {
    return switch tabs.variant {
      case Underline: 
        Breeze.compose(
          Spacing.pad('y', 0),
          Spacing.pad('x', 4),
          Spacing.margin('bottom', '-2px'),
          Border.width('bottom', '2px'),
          Border.style('solid'),
          Border.color('neutral', 300),
          Modifier.hover(Background.color('primary', 50)),
          Modifier.active(Background.color('primary', 100)),
          InputHeightStyle.Md.toStyle()
        );
      case Pill:
        Breeze.compose(
          Button.baseStyles,
          BorderRadiusStyle.Pill.toStyle(),
          Border.color('neutral', 0),
          Background.color('neutral', 0),
          Spacing.pad('x', 4),
          Sizing.height(10)
        );
      default: null;
    }
  }

  function getTabSelectedStyle(tabs:TabContext) {
    return switch tabs.variant {
      case Underline: 
        Breeze.compose(
          Border.width('bottom', '2px'),
          Border.style('solid'),
          Border.color('primary', 600),
        );
      case Pill:
        Breeze.compose(
          Background.color('primary', 600),
          Border.color('primary', 600),
          Typography.textColor('neutral', 0),
          Modifier.hover(
            Background.color('primary', 500),
            Border.color('primary', 500)
          ),
          Modifier.active(
            Background.color('primary', 600),
            Border.color('primary', 600),
          )
        );
      default: null;
    }
  }
}
