package seed;

import pine.*;
import pine.html.*;

class Portal extends ObjectComponent {
  static final type = new UniqueId();

  #if (js && !nodejs)
    final target:js.html.Element;
  #else
    final target:pine.render.Object;
  #end
  final child:Component;
  
  public function new(props) {
    super(null);
    this.target = props.target;
    this.child = props.child;
  }

  public function getChildren():Array<Component> {
    return [ child ];
  }

  public function getComponentType():UniqueId {
    return type;
  }

  override public function createObject(root:Root):Dynamic {
    return target;
  }

  override public function updateObject(root:Root, object:Dynamic, ?previousComponent:Component):Dynamic {
    return object;
  }

  override function insertObject(root:Root, object:Dynamic, slot:Null<Slot>, findParent:() -> Dynamic) {
    // noop
  }

  override function removeObject(root:Root, object:Dynamic, slot:Null<Slot>) {
    // noop
  }

  override function moveObject(root:Root, object:Dynamic, from:Null<Slot>, to:Null<Slot>, findParent:() -> Dynamic) {
    // noop
  }

  public function createElement():Element {
    return new ObjectWithChildrenElement(this);
  }

  public function getApplicatorType():UniqueId {
    return HtmlElementComponent.applicatorType;
  }
}
