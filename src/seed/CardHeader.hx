package seed;

import pine.*;
import pine.html.*;

using Nuke;

class CardHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:Array<HtmlChild>;

  public function render(context:Context):Component {
    return new Html<'header'>({
      className: styles,
      children: children
    });
  }
}
