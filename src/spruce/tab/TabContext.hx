package spruce.tab;

import pine.*;

typedef TabContextProvider = Provider<TabContext>; 

class TabContext implements Record {
  public static function from(context) {
    return TabContextProvider.from(context);
  }

  @track public var tabs:Array<Tab>;
  @track public var activeTab:Tab;

  public function isActive(tab:Tab) {
    return activeTab == tab;
  }

  public function setActiveTab(tab:Tab) {
    if (activeTab == tab) return;
    activeTab = tab;
  }
}
