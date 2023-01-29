package spruce.tab;

import pine.*;
import pine.debug.Debug;
import spruce.core.Box;
import spruce.tab.TabContext;

using Lambda;
using Nuke;

class TabGroup extends AutoComponent {
  final styles:ClassName = null;
  final tabs:Array<Tab>;
  final variant:TabVariant = Underline;

  public function render(context:Context) {
    Debug.assert(tabs.length > 0, 'At least one tab is required');

    return new TabContextProvider({
      create: () -> new TabContext({
        tabs: tabs,
        variant: variant,
        activeTab: tabs[0]
      }),
      dispose: tabs -> tabs.dispose(),
      render: tabs -> new Scope({
        render: _ -> new Box({
          styles: [
            'spruce-tab-group',
            styles
          ],
          layout: Vertical,
          children: [
            new TabGroupNav({
              children: [ for (tab in tabs.tabs) new TabButton({ tab: tab }) ]
            }),
            tabs.activeTab
          ]
        })
      })
    });
  }
}
