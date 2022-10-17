package seed2.animation;

import seed2.animation.TransitionStyle;

@:forward
abstract TransitionGroup(Array<TransitionStyle>) from Array<TransitionStyle> to Array<TransitionStyle> {
  public inline function new(styles) {
    this = styles;
  }

  public inline function invert():TransitionGroup {
    return [ for (style in this) ({
      property: style.property,
      start: style.end,
      end: style.start
    }:TransitionStyle) ];
  }
}
