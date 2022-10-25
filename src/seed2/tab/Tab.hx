package seed2.tab;

import pine.html.*;

using Nuke;

class Tab {
  public final label:HtmlChild;
  public final child:HtmlChild;
  public final buttonStyles:Null<ClassName>;
  public final panelStyles:Null<ClassName>;

  public function new(props:{
    label:HtmlChild,
    child:HtmlChild,
    ?buttonStyles:ClassName,
    ?panelStyles:ClassName
  }) {
    this.label = props.label;
    this.child = props.child;
    this.buttonStyles = props.buttonStyles;
    this.panelStyles = props.panelStyles;
  }
}
