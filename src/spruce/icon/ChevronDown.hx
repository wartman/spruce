package spruce.icon;

using eg.xml.XmlTools;

class ChevronDown extends AutoComponent {
  @:observable final styles:Null<ClassName> = null;

  function build() {
    return new Icon({
      styles: styles,
      child: '<svg:path d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>'.toComponent()
    });
  }
}
