package spruce.grid;

import pine.*;
import spruce.core.*;

using Nuke;

@:genericBuild(spruce.grid.GridColumnBuilder.buildGeneric())
class GridColumn<@:const Rest> {}

abstract class GridColumnBase extends AutoComponent {
  final styles:Null<ClassName> = null;
  final children:Children;

  abstract function getStyles():ClassName;

  public function build() {
    return new Box({
      styles: [
        'spruce-grid-column',
        getStyles(),
        styles
      ],
      children: children
    });
  }
}
