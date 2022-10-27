package spruce.placeholder;

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
        borderWidth: theme(spruce.spinner.track.width),
        borderStyle: 'solid',
        borderColor: theme(spruce.spinner.track.color),
        borderTopColor: theme(spruce.spinner.indicator.color),
        borderRadius: 50.pct(),
        width: theme(spruce.spinner.size, 1.em()),
        height: theme(spruce.spinner.size, 1.em()),
        animation: 'spin 1s linear infinite'
      }).with([
        'spruce-spinner',
        styles,
        switch position {
          case Inline: null;
          case Centered: Css.atoms({
            position: 'absolute',
            top: 50.pct() - calc(theme(spruce.spinner.size, 1.em()) / 2),
            left: 50.pct() - calc(theme(spruce.spinner.size, 1.em()) / 2)
          });
        }
      ])
    });
  }
}
