package seed;

import seed.controller.KeyboardController;
import pine.*;
import pine.html.*;
import seed.DropdownContext;

using Nuke;

// @todo: Needs to handle accessability stuff, including
// AIRA attributes and keyboard input.
class DropdownButton extends ImmutableComponent {
  @prop public final attachment:Attachment = { h: Middle, v: Bottom };
  @prop final styles:ClassName = null;
  @prop final label:HtmlChild;
  @prop final child:HtmlChild;

  function render(context:Context) {
    return new DropdownContextProvider({
      create: () -> new DropdownContext({
        status: Closed,
        attachment: attachment
      }),
      dispose: dropdown -> dropdown.dispose(),
      render: dropdown -> new Button({
        styles: styles,
        layout: Horizontal,
        onClick: _ -> dropdown.toggle(),
        children: [ 
          new Box({
            tag: Span,
            styles: Css.atoms({ marginRight: 'auto' }),
            children: [ label ]
          }),
          new Icon({
            styles: 
            Css.atoms({
              // @todo: Width/height need to be configurable
              width: 1.em(),
              height: 1.em()
            }),
            kind: CaretDown
          }),
          new Isolate({
            wrap: _ -> switch dropdown.getStatus() {
              case Open: createPopover(dropdown);
              case Closed: null;
            }
          })
        ] 
      })
    });
  }

  function createPopover(dropdown:DropdownContext) {
    var popover = new Popover({
      h: attachment.h,
      v: attachment.v,
      child: child
    });
    #if (js && !nodejs)
    return new Provider<KeyboardController>({
      create: () -> new KeyboardController(key -> switch key {
        // @todo: arrow buttons too? Probably handle that with builtin focus
        // stuff?
        case Escape: dropdown.close();
        default:
      }),
      dispose: controller -> controller.dispose(),
      render: _ -> popover
    });
    #else
    return popover;
    #end
  }
}
