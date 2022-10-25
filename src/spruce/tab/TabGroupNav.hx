package spruce.tab;

import pine.*;
import pine.html.*;
import spruce.menu.Menu;
import spruce.core.*;

using Nuke;

class TabGroupNav extends ImmutableComponent {
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Box({
      tag: Nav,
      styles: [
        Css.atoms({
          width: 100.pct()
        })
      ],
      children: new Menu({
        layout: Horizontal,
        children: children
      })
    });
  }
}
