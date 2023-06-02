package spruce.placeholder;

import pine.*;
import pine.html.*;

// @:keep final rootCss = Css.global({
//   '@keyframes spin': {
//     '0%': {
//       transform: 'rotate(0deg)',
//     },
//     '100%': {
//       transform: 'rotate(360deg)'
//     }
//   }
// });

enum SpinnerPosition {
  Centered;
  Inline;
}

class Spinner extends AutoComponent {
  final styles:ClassName = null;
  final position:SpinnerPosition = Inline;

  function build() {
    return new Html<'div'>({
      className: Breeze.compose(
        'spruce-spinner',
        styles,
        Transition.animation('spin'),
        Border.style('solid'),
        Border.width(1),
        Border.color('neutral', 800),
        // Don't have the ability to set the top color yet oops
        Border.radius('50%'),
        Sizing.width(7),
        Sizing.height(7)
      )
      // className: Css.atoms({
      //   borderWidth: theme(spruce.spinner.track.width),
      //   borderStyle: 'solid',
      //   borderColor: theme(spruce.spinner.track.color),
      //   borderTopColor: theme(spruce.spinner.indicator.color),
      //   borderRadius: 50.pct(),
      //   width: theme(spruce.spinner.size, 1.em()),
      //   height: theme(spruce.spinner.size, 1.em()),
      //   animation: 'spin 1s linear infinite'
      // }).with([
      //   'spruce-spinner',
      //   styles,
      //   switch position {
      //     case Inline: null;
      //     case Centered: Css.atoms({
      //       position: 'absolute',
      //       top: 50.pct() - calc(theme(spruce.spinner.size, 1.em()) / 2),
      //       left: 50.pct() - calc(theme(spruce.spinner.size, 1.em()) / 2)
      //     });
      //   }
      // ])
    });
  }
}
