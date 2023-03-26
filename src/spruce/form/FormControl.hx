package spruce.form;

import spruce.core.Box;
import pine.*;

using Nuke;

class FormControl extends AutoComponent {
  final styles:ClassName = null;
  final children:Children;

  function render(context:Context) {
    return new Box({
      styles: [
        styles
      ],
      tag: ListItem,
      children: [
        
      ]
    });
  }
}
