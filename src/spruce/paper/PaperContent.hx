package spruce.paper;

import pine.*;
import spruce.core.Box;
import pine.html.HtmlChildren;

using Nuke;

class PaperContent extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Box({
      styles: [
        'spruce-page-content',
        Css.atoms({
          padding: [
            theme(spruce.paper.padding.y),
            theme(spruce.paper.padding.x)
          ]
        }),
        styles
      ],
      children: children
    });
  }
}
