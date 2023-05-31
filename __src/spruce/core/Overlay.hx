package spruce.core;

using Nuke;

final baseStyles = Css.atoms({
  position: 'fixed',
  display: 'flex',
  flexWrap: 'wrap',
  justifyContent: 'center',
  alignItems: 'center',
  top: 0,
  bottom: 0,
  left: 0,
  right: 0,
  overflowX: 'hidden',
  overflowY: 'scroll',
  backgroundColor: theme(spruce.layer.background.color),
  zIndex: 9999
});
