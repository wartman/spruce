package seed2.core; 

macro function xs(expr) {
  return macro nuke.Css.atoms($expr);
}

macro function sm(expr) {
  return macro nuke.Css.mediaQuery({
    type: 'screen',
    minWidth: Constants.breakpointSm
  }, $expr);
}

macro function md(expr) {
  return macro nuke.Css.mediaQuery({
    type: 'screen',
    minWidth: '768px'
  }, $expr);
}

macro function lg(expr) {
  return macro nuke.Css.mediaQuery({
    type: 'screen',
    minWidth: '992px'
  }, $expr);
}

macro function xl(expr) {
  return macro nuke.Css.mediaQuery({
    type: 'screen',
    minWidth: '1200px'
  }, $expr);
}
