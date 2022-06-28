package seed.style;

class Breakpoint {
  public macro static function xs(expr) {
    return macro nuke.Css.atoms($expr);
  }

  public macro static function sm(expr) {
    return macro nuke.Css.mediaQuery({
      type: 'screen',
      minWidth: Constants.breakpointSm
    }, $expr);
  }

  public macro static function md(expr) {
    return macro nuke.Css.mediaQuery({
      type: 'screen',
      minWidth: '768px'
    }, $expr);
  }

  public macro static function lg(expr) {
    return macro nuke.Css.mediaQuery({
      type: 'screen',
      minWidth: '992px'
    }, $expr);
  }

  public macro static function xl(expr) {
    return macro nuke.Css.mediaQuery({
      type: 'screen',
      minWidth: '1200px'
    }, $expr);
  }
}
