package seed2.dropdown;

import pine.*;
import seed2.core.Attachment;

enum abstract DropdownStatus(Bool) {
  final Open = true;
  final Closed = false;
}

typedef DropdownContextProvider = Provider<DropdownContext>; 

class DropdownContext implements Record {
  public inline static function from(context:Context) {
    return DropdownContextProvider.from(context);
  }

  @track public var status:DropdownStatus;
  @prop public final attachment:Attachment;

  public function open() {
    status = Open;
  }

  public function close() {
    status = Closed;
  }

  public function toggle() {
    status = status == Open ? Closed : Open;
  }
}
