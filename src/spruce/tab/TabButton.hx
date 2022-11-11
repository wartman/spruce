package spruce.tab;

import spruce.core.BorderRadius;
import spruce.button.Button;
import pine.*;
import spruce.menu.*;

using Nuke;

class TabButton extends ImmutableComponent {
  @prop final tab:Tab;

  public function render(context:Context) {
    var tabs = TabContext.from(context);

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
        selected: tabs.isActive(tab),
        kind: Action(() -> tabs.setActiveTab(tab)),
        child: tab.label
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
            theme(spruce.color.primary700)
          ],
        });
      case Pill:
        Css.atoms({
          backgroundColor: theme(spruce.color.primary700),
          borderColor: theme(spruce.color.primary700),
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
