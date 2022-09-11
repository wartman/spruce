package seed;

import pine.*;
import pine.html.HtmlEvents;
import seed.controller.AnimationTools;

typedef DropdownContextProvider = Provider<DropdownContext>;

enum abstract DropdownStatus(Bool) {
  final Open = true;
  final Closed = false;
}

class DropdownContext implements Disposable implements DisposableHost {
  public inline static function from(context:Context) {
    return DropdownContextProvider.from(context);
  }

  public final attachment:Attachment;
  var status:State<DropdownStatus>;
  var disposables:Array<Disposable> = [];

  public function new(props) {
    this.attachment = props.attachment;
    this.status = new State(props.status);

    initObserver();
  }

  function initObserver() {
    function onClick(e:Event) {
      close();
    }
    addDisposable(new Observer(() -> switch status.get() {
      case Open: defer(() -> js.Browser.document.addEventListener('click', onClick));
      case Closed: js.Browser.document.removeEventListener('click', onClick);
    }));
    addDisposable(() -> {
      js.Browser.document.removeEventListener('click', onClick);
    }); 
  }

  public function open() {
    status.set(Open);
  }

  public function close() {
    status.set(Closed);
  }

  public function toggle() {
    switch status.get() {
      case Closed: open();
      case Open: close();
    }
  }

  public function getStatus() {
    return status.get();
  }

  public function dispose() {
    for (item in disposables) item.dispose();
    disposables.resize(0);
  }

  public function addDisposable(disposable:DisposableItem) {
    disposables.push(disposable);
  }
}
