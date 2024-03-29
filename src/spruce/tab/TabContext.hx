package spruce.tab;

import pine.*;

typedef TabContextProvider = Provider<TabContext>; 

class TabContext extends Record {
  public static function from(context) {
    return TabContextProvider.from(context);
  }

  public final variant:TabVariant;
  @:signal public final tabs:Array<Tab>;
  @:signal public final activeTab:Tab;

  public function isActive(tab:Tab) {
    return activeTab == tab;
  }

  public function setActiveTab(tab:Tab) {
    activeTab.set(tab);
  }

  override function dispose() {
    for (tab in tabs.peek()) tab.dispose();
    super.dispose();
  }
}
