package seed;

import pine.*;
import pine.html.*;

using Nuke;

// @todo: Using enums is a terrible way to handle icons.
enum IconKind {
  Close;
  Hamburger;
  CaretDown;
  CaretUp;
  ChevronDown;
  ChevronUp;
}

// @todo: This just contains a few icons I stole from Bootstrap. This
// isn't a great way to do this, but it'll let us test some things.
class Icon extends ImmutableComponent {
  @prop final kind:IconKind;
  @prop final styles:ClassName = null;

  function render(context:Context) {
    return new Svg<'svg'>({
      width: '32',
      height: '32',
      viewBox: '0 0 16 16',
      className: Css.atoms({
        fill: 'currentColor'
      }).with(styles),
      children: switch kind {
        case Close:
          new Svg<'path'>({
            d: 'M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z'
          });
        case Hamburger:
          new Svg<'path'>({
            // fillRule: 'evenodd',
            d: 'M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z'
          });
        case CaretDown:
          new Svg<'path'>({
            d: 'M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'
          });
        case CaretUp:
          new Svg<'path'>({
            d: 'm7.247 4.86-4.796 5.481c-.566.647-.106 1.659.753 1.659h9.592a1 1 0 0 0 .753-1.659l-4.796-5.48a1 1 0 0 0-1.506 0z'
          });
        case ChevronDown:
          new Svg<'path'>({
            d: 'M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'
          });
        case ChevronUp:
          new Svg<'path'>({
            d: 'M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z'
          });
      }
    });
  }
}
