package spruce.form;

import spruce.core.Box;
import haxe.http.HttpMethod;
import pine.*;
import pine.html.*;
import pine.html.HtmlEvents;

class Form extends AutoComponent {
  final action:String;
  final method:Null<HttpMethod> = null;
  final onSubmit:(e:Event)->Void = null;
  final children:Children;

  function build() {
    return new Html<'form'>({
      action: action,
      method: method,
      onSubmit: onSubmit,
      children: new Box({
        tag: UnorderedList,
        children: children
      })
    });
  }
}
