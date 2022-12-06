package spruce.grid;

import pine.*;
import pine.diffing.*;
import pine.html.*;
import spruce.core.*;

using Nuke;

@:genericBuild(spruce.grid.GridBuilder.buildGeneric())
class Grid<@:const Rest> {}

abstract class GridBase extends ProxyComponent {
  final styles:Null<ClassName>;
  final children:HtmlChildren;
  final span:GridSpan;

  public function new(props:{
    children:HtmlChildren,
    ?styles:ClassName,
    ?span:GridSpan,
    ?key:Key
  }) {
    super(props.key);
    this.styles = props.styles;
    this.children = props.children;
    this.span = props.span == null ? Auto : props.span;
  }

  abstract function getStyles():ClassName;
  
  public function render(context:Context) {
    return new Box({
      styles: [
        'spruce-grid',
        Css.atoms({
          display: 'grid',
          gridTemplateRows: repeat(theme(spruce.grid.rows, 1), 1.fr()),
          gridTemplateColumns: repeat(theme(spruce.grid.columns, 12), 1.fr()),
          gap: theme(spruce.grid.gap, 1.5.rem())
        }),
        styles,
        getStyles(),
        switch span {
          case Auto: null;
          case FullWidth: Css.atoms({ width: 100.pct() });
        }
      ],
      children: children
    });
  }
}
