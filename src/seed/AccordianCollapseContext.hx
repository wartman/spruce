package seed;

class AccordianCollapseContext extends CollapseContext {
  final accordian:AccordianContext;

  public function new(accordian) {
    this.accordian = accordian;
    super();
  }

  override function toggle(collapsed:Bool) {
    if (collapsed) accordian.hide(this) else accordian.show(this);
  }
}
