package seed2.tab;

import pine.*;
import seed2.menu.MenuItem;
import seed2.core.*;

using Nuke;

class TabButton extends ImmutableComponent {
  @prop final tab:Tab;

  public function render(context:Context) {
    return new MenuItem({
      child: new Box({
        styles: [
          'seed-tab-button',
          tab.buttonStyles,
          if (TabContext.from(context).isActive(tab)) Css.atoms({
            color: theme(seed.tab.nav.button.colors.active)
          }) else null,
          Css.atoms({
            alignItems: 'center',
            padding: [ 
              theme(seed.tab.nav.button.padding.y),
              theme(seed.tab.nav.button.padding.x) 
            ],
            cursor: 'pointer'
          })
        ],
        onClick: _ -> TabContext.from(context).setActiveTab(tab),
        children: [ tab.label ]
      })
    });
  }
}
