package spruce.modal;

import pine.*;
import pine.html.*;
import spruce.core.*;
import spruce.control.*;
import spruce.layer.LayerContext;
import spruce.icon.Icon;

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
        // backgroundColor: theme(spruce.modalHeader.bgColor),
        // color: theme(spruce.modalHeader.color),
        borderTopLeftRadius: theme(spruce.modal.border.radius),
        borderTopRightRadius: theme(spruce.modal.border.radius),
        padding: [ theme(spruce.modal.padding.y), theme(spruce.modal.padding.x) ],
      }).with([
        'spruce-modal-header',
        if (priority != null) priority.toStyle() else null,
        styles
      ]),
      children: [
        new Box({
          styles: Css
            .atoms({ marginRight: 'auto' })
            .with('spruce-modal-header-info'),
          children: [ child ]
        }),
        new ControlGroup({
          styles: 'spruce-modal-header-controls',
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
