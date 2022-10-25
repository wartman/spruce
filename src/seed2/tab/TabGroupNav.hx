package seed2.tab;

import seed.Box;
import pine.*;
import pine.html.*;
import seed2.menu.Menu;

using Nuke;

class TabGroupNav extends ImmutableComponent {
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Box({
      tag: Nav,
      styles: [
        Css.atoms({
          width: 100.pct(),
          borderBottom: [
            'solid',
            theme(seed.tab.nav.track.width),
            theme(seed.tab.nav.track.color),
          ]
        })
      ],
      children: new Menu({
        layout: Horizontal,
        children: children
      })
    });
  }
}
