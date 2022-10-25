package spruce.tab;

import pine.*;
import spruce.menu.*;
import spruce.core.*;

using Nuke;

class TabButton extends ImmutableComponent {
  @prop final tab:Tab;

  public function render(context:Context) {
    return new MenuItem({
      child: new MenuLink({
        styles: [
          'spruce-tab-button',
          tab.buttonStyles,
          if (TabContext.from(context).isActive(tab)) Css.atoms({
            color: theme(spruce.tab.nav.button.color.active)
          }) else Css.atoms({
            color: theme(spruce.tab.nav.button.color.inactive, 'inherit')
          }),
          Css.atoms({
            alignItems: 'center',
            cursor: 'pointer'
          }),
          Theme.define({
            spruce: {
              menu: {
                link: {
                  padding: { 
                    y: theme(spruce.tab.nav.button.padding.y),
                    x: theme(spruce.tab.nav.button.padding.x) 
                  }
                }
              }
            }
          })
        ],
        selectedStyles: [
          Css.atoms({
            borderBottom: [ 
              'solid', 
              theme(spruce.tab.nav.button.border.width, 1.px()), 
              theme(spruce.tab.nav.button.border.color, theme(spruce.tab.nav.button.color.active))
            ],
          })
        ],
        selected: TabContext.from(context).isActive(tab),
        kind: Action(() -> TabContext.from(context).setActiveTab(tab)),
        child: tab.label
      })
    });
  }
}
