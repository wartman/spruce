package seed;

import pine.*;
import pine.html.*;
import seed.style.Stack;

using Nuke;

class ModalHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Box({
      tag: Header,
      styles: Css.atoms({
        alignItems: 'center',
        backgroundColor: theme(seed.modalHeader.bgColor),
        color: theme(seed.modalHeader.color),
        borderTopLeftRadius: theme(seed.modal.border.radius, theme(seed.rounded.border.radius)),
        borderTopRightRadius: theme(seed.modal.border.radius, theme(seed.rounded.border.radius)),
        padding: [
          theme(seed.modal.padding.y, theme(seed.rounded.padding.y, theme(seed.box.padding.y))),
          theme(seed.modal.padding.x, theme(seed.rounded.padding.x, theme(seed.box.padding.x)))
        ],
      }).with([
        'seed-modal-header',
        Stack.horizontal,
        styles
      ]),
      children: [
        new Box({
          styles: Css
            .atoms({ marginRight: 'auto' })
            .with('seed-modal-header-info'),
          children: [ child ]
        }),
        new ControlGroup({
          styles: 'seed-modal-header-controls',
          controls: [
            new ControlButton({
              onClick: _ -> OverlayContext.from(context).hide(),
              child: 'X'
            })
          ]
        })
      ]
    });
  }
}
