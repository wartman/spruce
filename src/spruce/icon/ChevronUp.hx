package spruce.icon;

using eg.xml.XmlTools;

class ChevronUp extends AutoComponent {
  @:observable final styles:Null<ClassName> = null;

  function build() {
    return new Icon({
      styles: styles,
      child: '<svg:path d="M7.646 4.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 5.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z"/>'.toComponent()
    });
  }
}
