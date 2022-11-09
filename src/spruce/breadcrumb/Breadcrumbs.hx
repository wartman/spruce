package spruce.breadcrumb;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

class Breadcrumbs extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final prefix:HtmlChild = null;
  @prop final suffix:HtmlChild = null;
  @prop final separator:HtmlChild;
  @prop final children:HtmlChildren;

  public function render(context:Context) {
    return new Box({

    });
  }
}