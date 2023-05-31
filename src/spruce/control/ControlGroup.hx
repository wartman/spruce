package spruce.control;

import spruce.core.LayoutStyle;
import spruce.box.Box;

class ControlGroup extends AutoComponent {
  final styles:ClassName = null;
  final controls:Children;
  
  public function build() {
    return new Box({
      styles: Breeze.compose(
        'spruce-control-group',
        styles
      ),
      layout: LayoutStyle.Horizontal,
      children: controls
    });
  }
}
