package seed;

import pine.*;
import pine.html.*;

using Nuke;

class PopoverContainer extends ImmutableComponent {
  @prop final child:HtmlChild;
  @prop final styles:ClassName = null;

  override function init(context:InitContext) {
    PopoverContext.from(context).activate(context.getObject);
  }

  public function render(context:Context) {
    return new Box({
      styles: [
        Css.atoms({ 
          position: [ 'fixed', '!important' ],
          zIndex: 1000,
          opacity: 0,
          transition: [ 'opacity', 150.ms() ]
        }),
        'seed-popover',
        styles
      ],
      children: [ child ]
    });
  }
}
