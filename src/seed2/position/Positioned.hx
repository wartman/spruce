package seed2.position;

import pine.*;
import seed2.core.Attachment;

class Positioned extends Component {
  public static final type = new UniqueId();

  public final getTarget:()->Dynamic;
  public final attachment:Attachment;
  public final child:Component;
  
  public function new(props:{
    attachment:Attachment,
    child:Component,
    getTarget:()->Dynamic,
    ?key:Key
  }) {
    super(props.key);
    this.child = props.child;
    this.getTarget = props.getTarget;
    this.attachment = props.attachment;
  }

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new PositionedElement(this);
  }
}

class PositionedElement extends Element {
  var positioned(get, never):Positioned;
  inline function get_positioned():Positioned return getComponent();

  var child:Null<Element> = null;
  var registered:Bool = false;

  public function new(positioned:Positioned) {
    super(positioned);
  }

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, positioned.child, slot);
    position();
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, positioned.child, slot);
    position();
  }

  function performDispose() {
    #if (js && !nodejs)
    js.Browser.window.removeEventListener('resize', positionElement);
    js.Browser.window.removeEventListener('scroll', positionElement);
    #end
  }

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }
  
  public function position() {
    #if (js && !nodejs)
    if (!registered) {
      registered = true;
      js.Browser.window.addEventListener('resize', positionElement);
      js.Browser.window.addEventListener('scroll', positionElement);
      setupElement();
    }
    positionElement();
    #end
  }

  #if (js && !nodejs)
  function setupElement() {
    var el:js.html.Element = getObject();
    el.style.position = 'fixed';
    el.style.zIndex = '9000'; // @todo: Figure out a universal zIndex api
  }

  function positionElement() {
    var el:js.html.Element = getObject();
    var target:js.html.Element = positioned.getTarget();
    var targetRect = target.getBoundingClientRect();
    var container = getContainerSize();
    var vAttachment = positioned.attachment.v;
    var hAttachment = positioned.attachment.h;
    var top = switch vAttachment {
      case Top: 
        (targetRect.top) - el.offsetHeight;
      case Bottom: 
        targetRect.bottom;
      case Middle: 
        (targetRect.top) 
          + (target.offsetHeight / 2) 
          - (el.offsetHeight / 2);
    }
    var left = switch hAttachment {
      case Right: 
        targetRect.right;
      case Left: 
        (targetRect.left) - el.offsetWidth;
      case Middle:
        (targetRect.left)
          + (target.offsetWidth / 2)
          - (el.offsetWidth / 2);
    }

    if (overflowsVertical(top, el.offsetHeight)) top = switch vAttachment {
      case Top if (top > 0):
        container.bottom - el.offsetHeight;
      case Top:
        0;
      case Bottom if (top > 0):
        (targetRect.top) - el.offsetHeight;
      case Bottom:
        0;
      case Middle if (top > 0):
        targetRect.top;
      case Middle:
        0;
    }

    if (overflowsHorizontal(left, el.offsetWidth)) left = switch hAttachment {
      case Right:
        (targetRect.right) - el.offsetWidth;
      case Left:
        0;
      case Middle if (left > 0):
        (targetRect.right) - el.offsetWidth;
      case Middle:
        0;
    }

    el.style.top = '${top}px';
    el.style.left = '${left}px';
  }

  function getContainerSize():{ 
    top:Float,
    bottom:Float,
    left:Float, 
    right:Float 
  } {
    return {
      left: 0,
      top: 0,
      bottom: js.Browser.window.outerHeight,
      right: js.Browser.window.outerWidth
    };
  }
  
  function overflowsVertical(top:Float, height:Float) {
    return top < 0 || top + height >= getContainerSize().bottom;
  }

  function overflowsHorizontal(left:Float, width:Float) {
    return left < 0 || left + width >= getContainerSize().right;
  }
  #end
}
