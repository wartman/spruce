package spruce.icon;

import pine.signal.*;

class Icon extends AutoComponent {
  @:observable final styles:ClassName = null;
  final child:Child;

  function build() {
    return new pine.html.Svg<'svg'>({
      width: '32',
      height: '32',
      viewBox: '0 0 16 16',
      className: new Computation(() -> Breeze.compose(
        Svg.fill('currentColor'),
        Layout.display('block')
      ).with(styles?.get())),
      children: child
    });
  }
}
