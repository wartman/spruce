package spruce.tab;

import pine.*;
import pine.html.*;
import spruce.core.Box;

using Nuke;

// class Tab {
//   public final label:HtmlChild;
//   public final child:HtmlChild;
//   public final buttonStyles:Null<ClassName>;
//   public final panelStyles:Null<ClassName>;

//   public function new(props:{
//     label:HtmlChild,
//     child:HtmlChild,
//     ?buttonStyles:ClassName,
//     ?panelStyles:ClassName
//   }) {
//     this.label = props.label;
//     this.child = props.child;
//     this.buttonStyles = props.buttonStyles;
//     this.panelStyles = props.panelStyles;
//   }
// }

class Tab extends ImmutableComponent {
  @prop public final label:HtmlChild;
  @prop public final buttonStyles:ClassName = null;
  @prop final child:HtmlChild;
  @prop final styles:ClassName = null; 

  function render(context:Context) {
    return new Box({
      styles: [
        'spruce-tab-panel',
        styles
      ],
      children: [ child ]
    });
  }
}
