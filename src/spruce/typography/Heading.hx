package spruce.typography;

import kit.Assert;
import pine.*;
import pine.html.HtmlEvents;
import pine.internal.AttributeHost;

using Nuke;


class Heading extends AutoComponent implements AttributeHost {
  @:constant final level:Int;
  @:constant @:attr('class') final styles:ClassName = null;
  @:constant @:attr final onClick:EventListener = null;
  @:constant @:attr final role:String = null;
  @:constant final children:Children;

  function build() {
    return new ObjectComponent({
      createObject: (adaptor, attrs) -> adaptor.createCustomObject(getTag(level), attrs),
      attributes: getAttributes(),
      children: children
    });
  }

  function getTag(level:Int):String {
    assert(level > 0 && level < 6);
    return 'h$level';
  }
}
