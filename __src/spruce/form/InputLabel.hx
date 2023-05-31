package spruce.form;

import pine.*;
import pine.html.*;

using Nuke;

class InputLabel extends AutoComponent {
  final styles:ClassName = null;
  final target:String;

  function build() {
    return new Html<'label'>({
      className: ClassName.ofArray([
        styles
      ]),
      htmlFor: target,
      
    });
  }
}