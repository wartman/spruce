package spruce.modal;

import spruce.typography.Heading;

class ModalTitle extends AutoComponent {
  final styles:ClassName = null;
  final level:Int = 5;
  final child:Child;

  public function build() {
    return new Heading({
      level: level,
      styles: Breeze.compose(
        'spruce-modal-title',
        Spacing.margin('bottom', 0),
        styles
      ),
      children: [ child ]
    });
  }
}

