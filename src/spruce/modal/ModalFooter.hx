package spruce.modal;

import pine.*;
import spruce.core.Box;

using Nuke;

class ModalFooter extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

  public function render(context:Context) {
    return new Box({
      styles: [
        'spruce-modal-footer',
        Css.atoms({
          padding: [ 
            theme(spruce.spacing.medium),
            theme(spruce.spacing.medium) 
          ],
          justifyContent: 'flex-end'
        }),
        styles
      ],
      layout: Horizontal,
      spacing: Small,
      children: children
    });
  }
}
