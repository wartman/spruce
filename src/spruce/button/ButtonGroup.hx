package spruce.button;

import pine.*;
import pine.html.*;
import spruce.core.*;

using Nuke;

// @todo
class ButtonGroup extends ImmutableComponent {
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

  @prop final styles:ClassName = null;
  @prop final children:HtmlChildren;

  function render(context:Context) {
    return new Box({
      styles: [
        'spruce-button-group',
        baseStyles
      ],
      children: children
    });
  }
}
