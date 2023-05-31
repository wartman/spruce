package spruce.grid;

import spruce.box.Box;
import spruce.core.*;

@:genericBuild(spruce.grid.GridBuilder.buildGeneric())
class Grid<@:const Rest> {}

abstract class GridBase extends AutoComponent {
  final children:Children;
  final styles:Null<ClassName> = null;
  final spacing:SpacingStyle = Medium;
  final span:GridSpan = Auto;

  abstract function getStyles():ClassName;
  
  public function build() {
    return new Box({
      // styles: [
      //   'spruce-grid',
      //   Css.atoms({
      //     display: 'grid',
      //     gridTemplateRows: repeat(theme(spruce.grid.rows, 1), 1.fr()),
      //     gridTemplateColumns: repeat(theme(spruce.grid.columns, 12), 1.fr()),
      //     gap: theme(spruce.grid.gap, 1.5.rem())
      //   }),
      //   styles,
      //   getStyles(),
      //   switch span {
      //     case Auto: null;
      //     case FullWidth: Css.atoms({ width: 100.pct() });
      //   }
      // ],
      styles: Breeze.compose(
        'spruce-grid',
        styles,
        getStyles(),
        Breeze.Grid.display(),
        spacing.toGap(),
        switch span {
          case FullWidth: Sizing.width('full');
          case Auto: null;
        }
      ),
      children: children
    });
  }
}
