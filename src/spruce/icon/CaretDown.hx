package spruce.icon;

using eg.xml.XmlTools;

class CaretDown extends AutoComponent {
  @:observable final styles:Null<ClassName> = null;

  function build() {
    return new Icon({
      styles: styles,
      child: '<svg:path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>'.toComponent()
    });
  }
}
