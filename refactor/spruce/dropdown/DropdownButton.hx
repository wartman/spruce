package spruce.dropdown;

import pine.*;
import pine.html.*;
import spruce.button.*;
import spruce.core.*;
import spruce.icon.Icon;
import eg.PositionedAttachment;
import eg.DropdownContext;
import eg.Dropdown;

using Nuke;

class DropdownButton extends AutoComponent {
  public final attachment:PositionedAttachment = { h: Middle, v: Bottom };
  final styles:ClassName = null;
  final label:HtmlChild;
  final child:HtmlChild;
  final status:DropdownStatus = Closed;
  final priority:Priority = Neutral;
  final layout:Layout = Horizontal;
  final spacing:Spacing = None;
  final borderRadius:BorderRadius = Medium;
  final kind:ButtonKind = null;
  final size:ButtonSize = Md;

  function render(context:Context) {
    return new Dropdown({
      attachment: attachment,
      status: status,
      styles: [
        styles,
        Button.baseStyles,
        Button.focusStyles,
        priority.toStyle(),
        layout.toStyle(),
        spacing.toGap(),
        borderRadius.toStyle(),
        Css.atoms({ alignItems: 'center' })
      ],
      label: new Fragment({
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
          })
        ]
      }),
      child: child
    });
  }
}
