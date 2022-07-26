package seed;

import pine.*;
import seed.controller.*;
import seed.Attachment;

typedef PopoverContextProvider = Provider<PopoverContext>; 

class PopoverContext extends OverlayContext {
  public static inline function from(context:Context) {
    return PopoverContextProvider.from(context);
  }

  final getTarget:() -> Dynamic;
  final v:AttachmentVertical;
  final h:AttachmentHorizontal;
  final onHide:() -> Void;

  var position:Null<PositionController> = null;
  var visibility:VisibilityController = null;

  public function new(
    getTarget,
    v:AttachmentVertical,
    h:AttachmentHorizontal,
    onHide:()->Void
  ) {
    this.getTarget = getTarget;
    this.v = v;
    this.h = h;
    this.onHide = onHide;
  }

  public function activate(getEl:()->Dynamic) {
    Debug.assert(position == null && visibility == null);

    position = new PositionController({
      getEl: getEl,
      getTarget: getTarget,
      v: v,
      h: h
    });

    // @todo: We need to make this animation configurable somehow.
    visibility = new VisibilityController({
      getEl: getEl,
      animateShow: el -> {
        el.style.opacity = '1';
      },
      animateHide: el -> {
        el.style.opacity = '0';
      },
      beforeShow: () -> null,
      onShow: () -> null,
      onHide: onHide
    });

    position.activate();
    visibility.activate();
  }

  public function show() {
    if (visibility != null) visibility.show();
  }

  public function hide() {
    if (visibility != null) visibility.hide();
  }

  public function dispose() {
    if (position != null) position.dispose();
    if (visibility != null) visibility.dispose();
  }
}
