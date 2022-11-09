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
        'spruce-paper-content',
        Css.atoms({
          padding: [
            theme(spruce.spacing.small),
            theme(spruce.spacing.medium)
          ]
        }),
        styles
      ],
      children: children
    });
  }
}
