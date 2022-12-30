package spruce.typography;

import pine.*;
import pine.debug.Debug;
import pine.html.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.html.TagTypes.getTypeForTag;
import pine.core.UniqueId;

using Nuke;

typedef HeadingProps = {
  level:Int,
  ?styles:ClassName,
  ?onClick:EventListener,
  ?role:String,
  ?children:HtmlChildren
}

class Heading extends HtmlElementComponent<GlobalAttr & HtmlEvents> {
  final type:UniqueId;

  public function new(props:HeadingProps) {
    var tag = getTag(props.level);
    type = getTypeForTag(tag);

    super({
      tag: tag,
      attrs: {
        className: props.styles,
        onclick: props.onClick,
        role: props.role
      },
      children: props.children
    });
  }

  public function getComponentType() {
    return type;
  }

  function getTag(level:Int):String {
    Debug.assert(level > 0 && level < 6);
    return 'h$level';
  }
}
