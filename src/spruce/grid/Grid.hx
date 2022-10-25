package spruce.grid;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

@:genericBuild(spruce.grid.GridBuilder.buildGeneric())
class Grid<@:const Rest> {}

abstract class GridBase extends ProxyComponent {
  final styles:Null<ClassName>;
  final children:HtmlChildren;

  public function new(props:{
    children:HtmlChildren,
    ?styles:ClassName,
    ?key:Key
  }) {
    super(props.key);
    this.styles = props.styles;
    this.children = props.children;
  }

  abstract function getStyles():ClassName;
  
  public function render(context:Context) {
    return new Box({
      styles: Css.atoms({
        display: 'grid',
        gridTemplateRows: repeat(theme(spruce.grid.rows, 1), 1.fr()),
        gridTemplateColumns: repeat(theme(spruce.grid.columns, 12), 1.fr()),
        gap: theme(spruce.grid.gap, 1.5.rem())
      }).with([
        'spruce-grid',
        styles,
        getStyles()
      ]),
      children: children
    });
  }
}
