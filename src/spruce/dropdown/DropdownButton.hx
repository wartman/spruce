package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.button.Button;
import spruce.core.*;
import spruce.position.Popover;
import spruce.dropdown.DropdownContext;
import spruce.icon.Icon;

using Nuke;

class DropdownButton extends ImmutableComponent {
  @prop public final attachment:Attachment = { h: Middle, v: Bottom };
  @prop final styles:ClassName = null;
  @prop final label:HtmlChild;
  @prop final child:HtmlChild;

  function render(context:Context) {
    return new DropdownContextProvider({
      create: () -> new DropdownContext({ status: Closed, attachment: attachment }),
      dispose: dropdown -> dropdown.dispose(),
      render: dropdown -> new Button({
        styles: [
          styles,
          Css.atoms({ alignItems: 'center' })
        ],
        layout: Horizontal,
        onClick: _ -> dropdown.toggle(),
        children: [
          new Box({
            tag: Span,
            styles: Css.atoms({ marginRight: 'auto' }),
            children: [ label ]
          }),
          new Icon({
            styles: Css.atoms({
              width: 1.em(),
              height: 1.em()
            }),
            kind: CaretDown
          }),
          new Isolate({
            wrap: context -> switch dropdown.status {
              case Open: new DropdownPanel({
                onHide: () -> dropdown.close(),
                child: new Popover({
                  attachment: attachment,
                  child: child
                }) 
              });
              case Closed: null;
            }
          })
        ]
      })
    });
  }
}
