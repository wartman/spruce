package spruce.nav;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.box.Box;

class NavbarBrand extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;
  final onClick:(e:Event)->Void = null;
  final href:String = null;

  public function build():Component {
    var navbarBrandStyle = Breeze.compose(
      'spruce-navbar-brand',
      styles,
      Layout.display('block'),
      Spacing.margin('y', 0),
      Spacing.margin('left', 0),
      Spacing.margin('right', 'auto'),
      Spacing.pad(0)
    );

    if (href != null) return new Html<'a'>({
      href: href,
      onClick: onClick,
      className: navbarBrandStyle,
      children: [ child ]
    });

    return new Box({
      onClick: onClick,
      styles: navbarBrandStyle,
      children: [ child ]
    });
  }
}
