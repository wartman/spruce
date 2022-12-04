package spruce.core;

import pine.*;
import pine.element.*;
import pine.element.core.*;
import pine.element.proxy.*;

abstract class ProxyComponent extends Component {
  abstract public function render(context:Context):Component;

  function createAdapterManager(element:Element):AdapterManager {
    return new CoreAdapterManager();
  }

  final function createAncestorManager(element:Element):AncestorManager {
    return new CoreAncestorManager(element);
  }

  final function createChildrenManager(element:Element):ChildrenManager {
    return new ProxyChildrenManager(element, context -> {
      var proxy:ProxyComponent = context.getComponent();
      return proxy.render(context);
    });
  }

  final function createSlotManager(element:Element):SlotManager {
    return new ProxySlotManager(element);
  }

  final function createObjectManager(element:Element):ObjectManager {
    return new ProxyObjectManager(element);
  }
}
