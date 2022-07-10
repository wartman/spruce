package seed;

import pine.*;
import pine.html.*;

using Nuke;

@:genericBuild(seed.GridBuilder.buildGeneric())
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
        gridTemplateRows: repeat(theme(seed.grid.rows, 1), 1.fr()),
        gridTemplateColumns: repeat(theme(seed.grid.columns, 12), 1.fr()),
        gap: theme(seed.grid.gap, 1.5.rem())
      }).with([
        'seed-grid',
        styles,
        getStyles()
      ]),
      children: children
    });
  }
}
