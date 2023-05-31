package spruce.icon;

using eg.xml.XmlTools;

class ChevronLeft extends AutoComponent {
  @:observable final styles:Null<ClassName> = null;

  function build() {
    return new Icon({
      styles: styles,
      child: '<svg:path d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>'.toComponent()
    });
  }
}
