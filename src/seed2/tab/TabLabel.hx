package seed2.tab;

import pine.*;
import seed2.menu.MenuItem;
import seed2.button.Button;

using Nuke;

class TabLabel extends ImmutableComponent {
  @prop final tab:Tab;

  public function render(context:Context) {
    return new MenuItem({
      child: new Button({
        styles: [
          if (TabContext.from(context).isActive(tab)) 'active' else 'inactive'
        ],
        onClick: _ -> {
          TabContext.from(context).setActiveTab(tab);
        },
        children: tab.label
      })
    });
  }
}
