package spruce.grid;

import pine.*;
import spruce.box.Box;

@:genericBuild(spruce.grid.GridColumnBuilder.buildGeneric())
class GridColumn<@:const Rest> {}

abstract class GridColumnBase extends AutoComponent {
  final styles:Null<ClassName> = null;
  final children:Children;

  abstract function getStyles():ClassName;

  public function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-grid-column',
        getStyles(),
        styles
      ),
      children: children
    });
  }
}
