package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

using Nuke;

// @todo: Needs to handle accessability stuff, including
// AIRA attributes and keyboard input.
class Dropdown extends ObserverComponent {
  @prop final label:String;
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @track var isOpen:Bool = false;

  #if (js && !nodejs)
    override function init(context:InitContext) {
      function onClick(e:Event) {
        isOpen = false;
      }

      Effect.on(context).track(() -> {
        if (isOpen)
          js.Browser.document.addEventListener('click', onClick);
        else
          js.Browser.document.removeEventListener('click', onClick);
      });

      Cleanup.on(context).add(() -> {
        js.Browser.document.removeEventListener('click', onClick);
      });
    }
  #end

  public function render(context:Context) {
    // @todo: Make the toggle element configurable
    return new Button({
      onClick: e -> isOpen = !isOpen,
      styles: styles,
      children: [
        label,
        if (isOpen) new Popover({
          v: Bottom,
          h: Middle,
          child: child
        }) else null
      ]
    });
  }
}
