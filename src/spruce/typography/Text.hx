package spruce.typography;

import pine.*;
import pine.html.*;

using Nuke;

enum TextKind {
  Normal;
  Bold;
  Strong;
  Italic;
}

class Text extends AutoComponent {
  final styles:ClassName = null;
  final content:String;
  final kind:TextKind = Normal;

  function render(context:Context):Component {
    return switch kind {
      case Bold: 
        new Html<'b'>({ className: styles, children: content });
      case Italic:
        new Html<'i'>({ className: styles, children: content });
      case Strong:
        new Html<'strong'>({ className: styles, children: content });
      case Normal if (styles != null):
        new Html<'span'>({ className: styles, children: content });
      case Normal: 
        new HtmlTextComponent({ content: content });
    }
  }
}
