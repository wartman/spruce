package spruce.grid;

import pine.*;
import pine.diffing.*;
import spruce.core.*;

using Nuke;

@:genericBuild(spruce.grid.GridColumnBuilder.buildGeneric())
class GridColumn<@:const Rest> {}

abstract class GridColumnBase extends ProxyComponent {
  final styles:Null<ClassName>;
  final children:Children;

  public function new(props:{
    children:Children,
    ?styles:ClassName
  }) {
    this.styles = props.styles;
    this.children = props.children;
  }

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
