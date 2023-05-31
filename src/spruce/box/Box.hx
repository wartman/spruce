package spruce.box;

import pine.html.HtmlEvents;
import pine.internal.AttributeHost;
import spruce.core.*;

class Box extends AutoComponent implements AttributeHost {
  @:constant final tag:BoxTag = Div;
  @:constant final layout:LayoutStyle = LayoutStyle.Auto;
  @:constant final shadow:ShadowStyle = ShadowStyle.None;
  @:constant final spacing:SpacingStyle = SpacingStyle.None;
  @:constant final padding:SpacingStyle = SpacingStyle.None;
  @:constant final border:BorderStyle = BorderStyle.None;
  @:constant final radius:BorderRadiusStyle = BorderRadiusStyle.None;
  @:observable final styles:ClassName = null;
  @:observable @:attr final id:String = null;
  @:observable @:attr final lang:String = null;
  @:observable @:attr final dir:String = null;
  @:observable @:attr final role:String = null;
  @:observable @:attr final tabIndex:Int = null;
  @:observable @:attr final hidden:Bool = null;
  // @todo: What other events do we need?
  @:observable @:attr final onClick:EventListener = null;
  @:observable @:attr final onDblClick:EventListener = null;
  @:observable @:attr final onFocus:EventListener = null;
  @:observable @:attr final onBlur:EventListener = null;
  @:observable @:attr final onMouseDown:EventListener = null;
  @:observable @:attr final onMouseUp:EventListener = null;
  @:observable @:attr final onMouseEnter:EventListener = null;
  @:observable @:attr final onMouseLeave:EventListener = null;
  @:observable @:attr final onKeyDown:EventListener = null;
  @:observable @:attr final onKeyUp:EventListener = null;
  @:observable @:attr('aria-modal') final isModal:Bool = null;
  @:computed @:attr('class') final className:ClassName = Breeze.compose(
    if (styles != null) styles() else null, 
    layout.toStyle(),
    spacing.toGap(),
    padding.toPadding(),
    shadow.toStyle(),
    border.toStyle(),
    radius.toStyle()
  );
  @:constant final children:Children;

  function build() {
    return new ObjectComponent({
      createObject: (adaptor, attrs) -> adaptor.createCustomObject(tag, attrs),
      attributes: getAttributes(),
      children: children
    });
  }
}

enum abstract BoxTag(String) to String {
  final Div = 'div';
  final Aside = 'aside';
  final Article = 'article';
  final Blockquote = 'blockquote';
  final Section = 'section';
  final Header = 'header';
  final Footer = 'footer';
  final Main = 'main';
  final Nav = 'nav';
  final Span = 'span';
  final UnorderedList = 'ul';
  final OrderedList = 'ol';
  final ListItem = 'li';
}
