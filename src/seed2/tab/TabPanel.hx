package seed2.tab;

import pine.*;
import seed2.core.Box;

using Nuke;

class TabPanel extends ImmutableComponent {
  @prop final tab:Tab;

  function render(context:Context) {
    return new Box({
      styles: [
        'seed-tab-panel',
        tab.panelStyles
      ],
      children: [ tab.child ]
    });
  }
}
