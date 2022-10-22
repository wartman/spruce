package seed2.tab;

import pine.*;
import seed2.tab.TabContext;
import seed2.core.Box;
import seed2.menu.Menu;

using Nuke;
using Lambda;

class TabGroup extends ImmutableComponent {
  @prop final tabs:Array<Tab>;

  public function render(context:Context) {
    Debug.assert(tabs.length > 0, 'At least one tab is required');

    return new TabContextProvider({
      create: () -> new TabContext({
        tabs: tabs,
        activeTab: tabs[0]
      }),
      dispose: tabs -> tabs.dispose(),
      render: tabs -> new Isolate({
        wrap: _ -> new Box({
          layout: Vertical,
          children: [
            new Menu({
              layout: Horizontal,
              children: [ for (tab in tabs.tabs) new TabLabel({ tab: tab }) ]
            }),
            new Box({
              children: tabs.activeTab.render(context)
            })
          ]
        })
      })
    });
  }
}
