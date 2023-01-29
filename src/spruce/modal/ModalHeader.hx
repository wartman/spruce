package spruce.modal;

import eg.LayerContext;
import pine.*;
import spruce.control.*;
import spruce.core.*;
import spruce.icon.Icon;

using Nuke;

class ModalHeader extends AutoComponent {
  final styles:ClassName = null;
  // final priority:Priority = null;
  final child:Child;

  public function render(context:Context) {
    return new Box({
      tag: Header,
      layout: Horizontal,
      styles: Css.atoms({
        alignItems: 'center',
        padding: [ 
          theme(spruce.spacing.medium), 
          theme(spruce.spacing.medium) 
        ],
      }).with([
        'spruce-modal-header',
        // if (priority != null) priority.toStyle() else null,
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
