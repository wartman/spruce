package seed.style;

using Nuke;

class Stack {
  public static final vertical = Css.atoms({
    display: 'flex',
    flexDirection: 'column',
    // flex: ['1', '1', 'auto'],
    gap: theme(seed.stack.gap, theme(seed.grid.gap))
  });

  public static final horizontal = Css.atoms({
    display: 'flex',
    flexDirection: 'row',
    gap: theme(seed.stack.gap, theme(seed.grid.gap))
  });
}
