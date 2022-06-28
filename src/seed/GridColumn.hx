package seed;

import pine.*;
import pine.html.*;

using Nuke;

@:genericBuild(seed.GridColumnBuilder.buildGeneric())
class GridColumn<@:const Rest> {}

abstract class GridColumnBase extends ProxyComponent {
  final styles:Null<ClassName>;
  final children:Array<HtmlChild>;

  public function new(props:{
    children:Array<HtmlChild>,
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
      styles: getStyles().with([
        'seed-grid-column',
        styles
      ]),
      children: children
    });
  }
}
