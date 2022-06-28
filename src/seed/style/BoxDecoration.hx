package seed.style;

using Nuke;

class BoxDecoration {
  public static final rounded = Css.atoms({
    borderRadius: theme(seed.rounded.border.radius),
    padding: [ 
      theme(seed.rounded.padding.y, theme(seed.box.padding.y)),
      theme(seed.rounded.padding.x, theme(seed.box.padding.x))
    ]
  });
}
