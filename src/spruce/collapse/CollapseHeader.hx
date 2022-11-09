package spruce.collapse;

import pine.*;
import pine.html.*;
import spruce.core.Box;
import spruce.icon.Icon;

using Nuke;

class CollapseHeader extends ObserverComponent {
  public static final baseStyles = Css.atoms({
    display: 'flex',
    width: 100.pct(),
    padding: theme(spruce.spacing.medium),
    cursor: 'pointer',
    outline: 0,
    alignItems: 'center'
  });
  
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  function render(context:Context) {
    var collapse = CollapseContext.from(context);

    return new Box({
      tag: Header,
      styles: [
        'spruce-collapse-header',
        baseStyles,
        spruce.button.Button.focusStyles,
        styles
      ],
      layout: Horizontal,
      onclick: _ -> collapse.toggle(),
      onkeydown: e -> {
        var event:js.html.KeyboardEvent = cast e;
        switch event.key {
          case 'Enter': collapse.toggle();
          default:
        }
      },
      role: 'button',
      tabIndex: 0,
      children: [
        new Box({
          styles: Css.atoms({ marginRight: 'auto' }),
          children: [ child ]
        }),
        new Icon({
          styles: [
            Css.atoms({
              width: 1.em(),
              height: 1.em(),
              transition: [ 'transform', collapse.duration.ms(), 'ease-in-out' ]
            }),
            if (collapse.status == Expanded) Css.atoms({
              transform: rotate((-180).deg())
            }) else null
          ],
          kind: ChevronDown
        })
      ]
    });
  }
}