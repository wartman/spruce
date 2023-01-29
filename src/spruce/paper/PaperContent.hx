package spruce.paper;

import pine.*;
import spruce.core.Box;

using Nuke;

class PaperContent extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

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
