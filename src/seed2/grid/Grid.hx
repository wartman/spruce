package seed2.grid;

import pine.*;
import pine.html.*;
import seed2.core.Box;

using Nuke;

@:genericBuild(seed2.grid.GridBuilder.buildGeneric())
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
        gridTemplateRows: repeat(theme(seed2.grid.rows, 1), 1.fr()),
        gridTemplateColumns: repeat(theme(seed2.grid.columns, 12), 1.fr()),
        gap: theme(seed2.grid.gap, 1.5.rem())
      }).with([
        'seed2-grid',
        styles,
        getStyles()
      ]),
      children: children
    });
  }
}
