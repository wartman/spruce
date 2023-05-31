package spruce.icon;

using eg.xml.XmlTools;

class Hamburger extends AutoComponent {
  @:observable final styles:Null<ClassName> = null;

  function build() {
    return new Icon({
      styles: styles,
      child: '<svg:path d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>'.toComponent()
    });
  }
}
