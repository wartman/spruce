package spruce.typography;

import kit.Assert;
import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import pine.html.HtmlAttributes;

using Nuke;

class Heading extends AutoComponent {
  final level:Int;
  final styles:ClassName = null;
  final onClick:EventListener = null;
  final role:String = null;
  final children:Children;

  function build() {
    return new HtmlObjectComponent<GlobalAttr & HtmlEvents & { children:Children }>(getTag(level), {
      className: styles,
      onClick: onClick,
      role: role,
      children: children
    });
  }

  function getTag(level:Int):String {
    assert(level > 0 && level < 6);
    return 'h$level';
  }
}
