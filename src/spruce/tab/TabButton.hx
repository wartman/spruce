package spruce.tab;

import pine.*;
import spruce.button.Button;
import spruce.core.BorderRadius;
import spruce.menu.*;
import spruce.menu.MenuLink;

using Nuke;

class TabButton extends AutoComponent {
  final tab:Tab;

  public function build() {
    var tabs = TabContext.from(this);

    return new MenuItem({
      child: new MenuLink({
        styles: [
          'spruce-tab-button',
          tab.buttonStyles,
          Css.atoms({
            alignItems: 'center',
            cursor: 'pointer'
          }),
          getTabStyle(tabs)
        ],
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
        Css.atoms({
          padding: [ 0, theme(spruce.spacing.medium)],
          lineHeight: theme(spruce.input.height.medium),
          height: theme(spruce.input.height.medium),
          marginBottom: (-2).px(),
          borderBottom: [ 
            'solid', 
            2.px(), 
            theme(spruce.color.neutral300)
          ],
          ':hover': {
            backgroundColor: theme(spruce.color.primary50)
          },
          ':active': {
            backgroundColor: theme(spruce.color.primary100),
          }
        });
      case Pill:
        Button.baseStyles.with([
          BorderRadius.Pill.toStyle(),
          Css.atoms({ 
            borderColor: theme(spruce.color.neutral0),
            backgroundColor: theme(spruce.color.neutral0),
            ':hover': {
              backgroundColor: theme(spruce.color.primary50)
            },
            ':active': {
              backgroundColor: theme(spruce.color.primary100)
            }
          })
        ]);
      default: null;
    }
  }

  function getTabSelectedStyle(tabs:TabContext) {
    return switch tabs.variant {
      case Underline: 
        Css.atoms({
          borderBottom: [ 
            'solid', 
            2.px(), 
            theme(spruce.color.primary600)
          ],
        });
      case Pill:
        Css.atoms({
          backgroundColor: theme(spruce.color.primary600),
          borderColor: theme(spruce.color.primary600),
          color: theme(spruce.color.neutral0),
          ':hover': {
            backgroundColor: theme(spruce.color.primary500),
            borderColor: theme(spruce.color.primary500),
          },
          ':active': {
            backgroundColor: theme(spruce.color.primary600),
            borderColor: theme(spruce.color.primary600),
          }
        });
      default: null;
    }
  }
}
