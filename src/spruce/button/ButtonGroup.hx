package spruce.button;

import pine.*;
import spruce.core.*;

using Nuke;

// @todo
class ButtonGroup extends AutoComponent {
  static final baseStyles = Css.atoms({

  }).with([
    Theme.define({
      spruce: {
        button: { 
          border: { 
            radius: 0
          } 
        },
        priority: {
          primary: { border: 'none' },
          secondary: { border: 'none' },
          success: { border: 'none' },
          danger: { border: 'none' },
          warning: { border: 'none' },
          info: { border: 'none' },
        }
      }
    })
  ]);

  final styles:ClassName = null;
  final children:Children;

  function build() {
    return new Box({
      styles: [
        'spruce-button-group',
        baseStyles
      ],
      children: children
    });
  }
}
