package spruce.collapse;

import eg.CollapseContext;
import pine.signal.*;
import spruce.box.Box;
import spruce.icon.ChevronDown;

class CollapseHeader extends AutoComponent {
  final styles:ClassName = null;
  final child:Child;

  function build() {
    var collapse = CollapseContext.from(this);
    return new Box({
      tag: Header,
      styles: Breeze.compose(
        'spruce-collapse-header',
        styles,
        Flex.display(),
        Flex.alignItems('center'),
        Sizing.width('full'),
        Spacing.pad(3),
        Border.outlineWidth(0),
        Interactive.cursor('pointer')
      ),
      onClick: _ -> collapse.toggle(),
      onKeyDown: e -> {
        var event:js.html.KeyboardEvent = cast e;
        switch event.key {
          case 'Enter': collapse.toggle();
          default:
        }
      },
      role: 'button',
      tabIndex: 0,
      children: [
        new Box({
          styles: Spacing.margin('right', 'auto'),
          children: [ child ]
        }),
        new ChevronDown({
          styles: new Computation(() -> Breeze.compose(
            Sizing.width(5),
            Sizing.height(5),
            Transition.transition('transform'),
            if (collapse.status() == Expanded) Transform.rotate(-180) else null
          ))
        })
      ]
    });
  }
}
