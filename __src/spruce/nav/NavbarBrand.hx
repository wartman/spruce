package spruce.nav;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import spruce.core.Box;

using Nuke;

class NavbarBrand extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;
  final onClick:(e:Event)->Void = null;
  final href:String = null;

  public function build():Component {
    var navbarBrandStyle = Css.atoms({
      display: 'block',
      marginTop: 0,
      marginBottom: 0,
      marginRight: 'auto',
      marginLeft: 0,
      padding: 0
    }).with([
      'spruce-navbar-brand',
      styles
    ]);

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
