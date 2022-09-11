package seed;

class AccordianCollapseContext extends CollapseContext {
  final accordian:AccordianContext;

  public function new(props) {
    this.accordian = props.accordian;
    super(props);
  }

  override function toggle(collapsed:Bool) {
    if (collapsed) accordian.hide(this) else accordian.show(this);
  }
}
