package spruce.tab;

import spruce.box.Box;
import pine.*;

class TabPanel extends AutoComponent {
  final tab:Tab;

  function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-tab-panel',
        tab.styles
      ),
      children: [ tab.child(this) ]
    });
  }
}
