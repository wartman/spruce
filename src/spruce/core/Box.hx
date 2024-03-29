package spruce.core;

import pine.*;
import pine.html.HtmlAttributes;
import pine.html.HtmlEvents;
import pine.signal.Signal;
import spruce.core.BorderRadius;
import spruce.core.Shadow;

using Nuke;
using Reflect;

class Box extends AutoComponent {
  final props:BoxProps;

  public function new(props) {
    this.props = props;  
  }

  function build() {
    var tag = props.tag ?? Div;
    var layout:Layout = props.layout ?? Auto;
    var spacing:Spacing = props.spacing ?? None;
    var shadow:Shadow = props.shadow ?? Shadow.None;
    var borderRadius:BorderRadius = props.borderRadius ?? BorderRadius.None;
    var children = props.children;

    props.className = ClassName.ofArray([
      props.styles,
      layout.toStyle(),
      spacing.toGap(),
      shadow.toStyle(),
      borderRadius.toStyle()
    ]);

    props.deleteField('children');
    props.deleteField('tag');
    props.deleteField('styles');
    props.deleteField('layout');
    props.deleteField('spacing');
    props.deleteField('shadow');
    props.deleteField('borderRadius');

    return new ObjectComponent({
      createObject: (adaptor, attrs) -> adaptor.createContainerObject(attrs),
      attributes: {
        var attributes:Map<String, ReadonlySignal<Any>> = [];
        for (field in Reflect.fields(props)) {
          attributes.set(field, Reflect.field(props, field));
        }
        attributes;
      },
      children: children
    });
  }
}

typedef BoxProps = {
  ?tag:BoxTag,
  ?styles:ClassName,
  ?layout:Layout,
  ?spacing:Spacing,
  ?shadow:Shadow,
  ?borderRadius:BorderRadius,
  ?children:Children
} & AriaAttributes & GlobalAttr & HtmlEvents;

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

