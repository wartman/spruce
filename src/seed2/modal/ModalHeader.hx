package seed2.modal;

import pine.*;
import pine.html.*;
import seed2.core.*;
import seed2.control.*;
import seed2.layer.LayerContext;
import seed2.icon.Icon;

using Nuke;

class ModalHeader extends ImmutableComponent {
  @prop final styles:ClassName = null;
  @prop final priority:Priority = null;
  @prop final child:HtmlChild;

  public function render(context:Context) {
    return new Box({
      tag: Header,
      layout: Horizontal,
      styles: Css.atoms({
        alignItems: 'center',
        // backgroundColor: theme(seed.modalHeader.bgColor),
        // color: theme(seed.modalHeader.color),
        borderTopLeftRadius: theme(seed.modal.border.radius),
        borderTopRightRadius: theme(seed.modal.border.radius),
        padding: [ theme(seed.modal.padding.y), theme(seed.modal.padding.x) ],
      }).with([
        'seed-modal-header',
        if (priority != null) priority.toStyle() else null,
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
              onClick: _ -> LayerContext.from(context).hide(),
              ariaLabel: 'Close',
              child: new Icon({
                styles: Css.atoms({ width: 2.em(), height: 2.em() }),
                kind: Close
              })
            })
          ]
        })
      ]
    });
  }
}
