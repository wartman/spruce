package spruce.form;

import spruce.core.Box;
import haxe.http.HttpMethod;
import pine.*;
import pine.html.*;

class Form extends AutoComponent {
  final action:String;
  final method:Null<HttpMethod> = null;
  final children:Children;

  function render(context:Context) {
    return new Html<'form'>({
      action: action,
      method: method,
      children: new Box({
        tag: UnorderedList,
        children: children
      })
    });
  }
}
