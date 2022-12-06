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
  final child:HtmlChild;
  final priority:Priority = Neutral;
  final layout:Layout = Horizontal;
  final spacing:Spacing = Small;
  final borderRadius:BorderRadius = Medium;
  final kind:ButtonKind = null;
  final size:ButtonSize = Md;

  function render(context:Context) {
    return new Button({
      styles: [
        styles,
        Css.atoms({ alignItems: 'center' })
      ],
      onClick: _ -> {
        DropdownContext.from(context).toggle();
      },
      priority: priority,
      layout: layout,
      spacing: spacing,
      borderRadius: borderRadius,
      kind: kind,
      size: size,
      children: [
        new Box({
          tag: Span,
          styles: Css.atoms({ marginRight: 'auto' }),
          children: [ child ]
        }),
        new Icon({
          styles: Css.atoms({
            width: 1.em(),
            height: 1.em()
          }),
          kind: CaretDown
        })
      ]
    });
  }
}
