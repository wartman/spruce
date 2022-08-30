package seed;

import pine.*;
import pine.html.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.html.TagTypes.getTypeForTag;

using Nuke;

typedef BoxProps = {
  ?tag:BoxTag,
  ?styles:ClassName,
  ?layout:Layout,
  ?role:String,
  ?children:HtmlChildren,
  ?onClick:EventListener,
  ?onKeyUp:EventListener,
  ?onDblClick:EventListener
};

class Box extends HtmlElementComponent<GlobalAttr & HtmlEvents> {
  final type:UniqueId;

  public function new(props:BoxProps) {
    var tag:BoxTag = props.tag == null ? Div : props.tag;
    var layout:Layout = props.layout == null ? Auto : props.layout;

    type = getTypeForTag(tag);

    super({
      tag: tag,
      attrs: {
        className: ClassName.ofArray([
          props.styles,
          layout.toStyle()
        ]),
        role: props.role,
        onclick: props.onClick,
        ondblclick: props.onDblClick,
        onkeyup: props.onKeyUp
      },
      children: props.children == null ? [] : props.children
    });
  }

  public function getComponentType():UniqueId {
    return type;
  }
}

enum abstract BoxTag(String) to String {
  // final Html = 'html';
  // final Body = 'body';
  // final Iframe = 'iframe';
  // final Object = 'object';
  // final Head = 'head';
  // final Title = 'title';
  final Div = 'div';
  // final Code = 'code';
  final Aside = 'aside';
  final Article = 'article';
  final Blockquote = 'blockquote';
  final Section = 'section';
  final Header = 'header';
  final Footer = 'footer';
  final Main = 'main';
  final Nav = 'nav';
  // final Table = 'table';
  // final TableHead = 'thead';
  // final TableBody = 'tbody';
  // final TableFoot = 'tfoot';
  // final TabelRow = 'tr';
  // final TableData = 'td';
  // final TableHeader = 'th';
  // final H1 = 'h1';
  // final H2 = 'h2';
  // final H3 = 'h3';
  // final H4 = 'h4';
  // final H5 = 'h5';
  // final H6 = 'h6';
  // final Strong = 'strong';
  // final Em = 'em';
  final Span = 'span';
  // final Anchor = 'a';
  // final Paragraph = 'p';
  // final Ins = 'ins';
  // final Del = 'del';
  // final Idiomatic = 'i';
  // final BringAttention = 'b';
  // final Small = 'small';
  // final Menu = 'menu';
  final UnorderedList = 'ul';
  final OrderedList = 'ol';
  final ListItem = 'li';
  final Label = 'label';
  final Button = 'button';
  // final Pre = 'pre';
  // final Picture = 'picture';
  // final Canvas = 'canvas';
  // final Audio = 'audio';
  // final Video = 'video';
  // final Form = 'form';
  // final Fieldset = 'fieldset';
  // final Legend = 'legend';
  // final Select = 'select';
  // final Option = 'option';
  // final Dl = 'dl';
  // final Dt = 'dt';
  // final Dd = 'dd';
  // final Details = 'details';
  // final Summary = 'summary';
  // final Figure = 'figure';
  // final Figcaption = 'figcaption';
}
