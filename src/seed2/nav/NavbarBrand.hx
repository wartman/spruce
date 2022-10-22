package seed2.nav;

import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;
import seed2.core.Box;

using Nuke;

class NavbarBrand extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final onClick:(e:Event)->Void = null;
  @prop final href:String = null;

  public function render(context:Context):Component {
    var navbarBrandStyle = Css.atoms({
      display: 'block',
      marginTop: 0,
      marginBottom: 0,
      marginRight: 'auto',
      marginLeft: 0,
      padding: 0
    }).with([
      'seed-navbar-brand',
      styles
    ]);

    if (href != null) return new Html<'a'>({
      href: href,
      onclick: onClick,
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
