package seed2.async;

import pine.*;
import pine.html.*;

using Nuke;

@:keep final rootCss = Css.global({
  '@keyframes spin': {
    '0%': {
      transform: 'rotate(0deg)',
    },
    '100%': {
      transform: 'rotate(360deg)'
    }
  }
});

enum SpinnerPosition {
  Centered;
  Inline; 
}

class Spinner extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final position:SpinnerPosition = Inline;

  function render(context:Context) {
    return new Html<'div'>({
      className: Css.atoms({
        borderWidth: theme(seed.spinner.track.width),
        borderStyle: 'solid',
        borderColor: theme(seed.spinner.track.color),
        borderTopColor: theme(seed.spinner.indicator.color),
        borderRadius: 50.pct(),
        width: theme(seed.spinner.size, 1.em()),
        height: theme(seed.spinner.size, 1.em()),
        animation: 'spin 1s linear infinite'
      }).with([
        'seed-spinner',
        styles,
        switch position {
          case Inline: null;
          case Centered: Css.atoms({
            position: 'absolute',
            top: 50.pct() - calc(theme(seed.spinner.size, 1.em()) / 2),
            left: 50.pct() - calc(theme(seed.spinner.size, 1.em()) / 2)
          });
        }
      ])
    });
  }
}
