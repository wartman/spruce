package spruce.tab;

import spruce.core.Box;
import pine.*;

using Nuke;

class TabPanel extends AutoComponent {
  final tab:Tab;

  function build() {
    return new Box({
      styles: [
        'spruce-tab-panel',
        tab.styles
      ],
      children: [ tab.child(this) ]
    });
  }
}
