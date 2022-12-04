package spruce.core;

import pine.*;

@:autoBuild(spruce.core.HookComponentBuilder.build())
abstract class HookComponent extends Component {
  abstract public function getChild():Component;
}
