package spruce.tab;

import pine.*;

using Nuke;

class Tab extends Record {
  public final label:(context:Component)->Child;
  public final buttonStyles:ClassName = null;
  public final child:(context:Component)->Child;
  public final styles:ClassName = null;
}
