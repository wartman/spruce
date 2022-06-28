package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.html.TagTypes.getTypeForTag;

using Nuke;

typedef HeadingProps = {
  level:Int,
  ?styles:ClassName,
  ?onClick:EventListener,
  ?role:String,
  ?children:Array<HtmlChild>
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

  function getTag(level:Int):String {
    Debug.assert(level > 1 && level < 6);
    return 'h$level';
  }

  public function getComponentType():UniqueId {
    return type;
  }
}
