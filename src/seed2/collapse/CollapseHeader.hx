package seed2.collapse;

import pine.*;
import pine.html.*;
import seed2.core.Box;
import seed2.icon.Icon;

using Nuke;

class CollapseHeader extends ObserverComponent {
  public static final baseStyles = Css.atoms({
    display: 'flex',
    width: 100.pct(),
    backgroundColor: theme(seed.collapse.bgColor, 'transparent'),
    fontFamily: theme(seed.collapse.header.font.family, 'inherit'), 
    fontSize: theme(seed.collapse.header.font.size, 'inherit'),
    fontColor: theme(seed.collapse.header.font.color, 'inherit'),
    outline: 0
  });
  
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  function render(context:Context) {
    var collapse = CollapseContext.from(context);

    return new Box({
      tag: Button,
      styles: [
        'seed-collapse-header',
        baseStyles,
        seed2.button.Button.focusStyles,
        styles
      ],
      layout: Horizontal,
      onClick: _ -> collapse.toggle(),
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
            if (collapse.status == Collapsed) Css.atoms({
              transform: rotate((-180).deg())
            }) else null
          ],
          kind: ChevronDown
        })
      ]
    });
  }
}