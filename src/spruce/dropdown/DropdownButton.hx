package spruce.dropdown;

import eg.DropdownContext;
import eg.PositionedAttachment;
import spruce.box.Box;
import spruce.button.*;
import spruce.core.*;
import spruce.icon.*;

class DropdownButton extends AutoComponent {
  public final attachment:PositionedAttachment = { h: Middle, v: Bottom };
  final styles:ClassName = null;
  final child:Child;
  final priority:PriorityStyle = Neutral;
  final layout:LayoutStyle = Horizontal;
  final spacing:SpacingStyle = Small;
  final radius:BorderRadiusStyle = Medium;
  final kind:ButtonKind = null;
  final size:ButtonSize = Md;

  function build() {
    return new Button({
      styles: Breeze.compose(
        'spruce-dropdown-button',
        styles,
        Flex.alignItems('center')
      ),
      onClick: e -> {
        e.preventDefault();
        e.stopPropagation();
        DropdownContext.from(this).toggle();
      },
      priority: priority,
      layout: layout,
      spacing: spacing,
      radius: radius,
      kind: kind,
      size: size,
      children: [
        new Box({
          tag: Span,
          styles: Spacing.margin('right', 'auto'),
          children: [ child ]
        }),
        new CaretDown({
          styles: Breeze.compose(
            Sizing.width(3),
            Sizing.height(3)
          )
        })
      ]
    });
  }
}

