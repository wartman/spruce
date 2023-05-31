package spruce.tab;

import kit.Assert;
import pine.*;
import spruce.core.Box;
import spruce.tab.TabContext;

using Lambda;
using Nuke;

class TabGroup extends AutoComponent {
  final styles:ClassName = null;
  final tabs:Array<Tab>;
  final variant:TabVariant = Underline;

  public function build() {
    assert(tabs.length > 0, 'At least one tab is required');

    return new TabContextProvider({
      value: new TabContext({
        tabs: tabs,
        variant: variant,
        activeTab: tabs[0]
      }),
      child: tabs -> new Box({
        styles: [
          'spruce-tab-group',
          styles
        ],
        layout: Vertical,
        children: [
          new TabGroupNav({
            children: new Each(tabs.tabs, tab -> new TabButton({ tab: tab }))
          }),
          new Scope(_ -> new TabPanel({ tab: tabs.activeTab() }))
        ]
      })
    });
  }
}
