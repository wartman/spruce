package spruce.dropdown;

import pine.*;
import pine.html.*;
import eg.PositionedAttachment;
import eg.DropdownContext;

class Dropdown extends AutoComponent {
  final toggle:HtmlChild;
  final child:HtmlChild;
  final attachment:PositionedAttachment = { h: Middle, v: Bottom };
  final status:DropdownStatus = Closed;

  function render(context:Context) {
    return new eg.Dropdown({
      toggle: toggle,
      child: child,
      status: status,
      attachment: attachment
    });
  }
}
