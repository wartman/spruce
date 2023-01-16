package spruce.core;

import pine.*;
import pine.element.ProxyElementEngine;

abstract class ProxyComponent extends Component {
  abstract public function render(context:Context):Component;

  function createElement() {
    return new Element(
      this, 
      useProxyElementEngine((element:ElementOf<ProxyComponent>) -> element.component.render(element)),
      []
    );
  }
}
