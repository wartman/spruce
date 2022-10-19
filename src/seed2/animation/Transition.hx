package seed2.animation;

import pine.*;

using Nuke;

class Transition extends Component {
  public final transitions:TransitionGroup;
  public final speed:Int;
  public final onTransition:Null<()->Void>;
  public final render:()->Component;

  public function new(props:{
    transitions:TransitionGroup,
    speed:Int,
    ?onTransition:Null<()->Void>,
    render:()->Component,
    ?key:Key
  }) {
    super(props.key);
    this.transitions = props.transitions;
    this.speed = props.speed;
    this.onTransition = props.onTransition;
    this.render = props.render;
  }

  static final type = new UniqueId();

  public function getComponentType():UniqueId {
    return type;
  }

  public function createElement():Element {
    return new TransitionElement(this);
  }
}

class TransitionElement extends Element {
  final classes:Array<ClassName> = [];

  var child:Null<Element> = null;
  var transition(get, never):Transition;
  function get_transition():Transition return getComponent();

  public function new(transition:Transition) {
    super(transition);
  }

  function performHydrate(cursor:HydrationCursor) {
    child = hydrateElementForComponent(cursor, transition.render(), slot);
    
    #if (js && !nodejs)
    var el:js.html.Element = getObject();
    applyBaseStyles();
    
    for (style in transition.transitions) {
      el.style.setProperty(style.property, style.end);
    }
    #end
  }

  function performBuild(previousComponent:Null<Component>) {
    child = updateChild(child, transition.render(), slot);

    if (previousComponent == null) {
      setup();
    } else if (previousComponent != component) {
      cleanup();
      setup();
    }
  }

  function performDispose() {
    #if (js && !nodejs)
    clearListeners();
    #end
  }

  public function visitChildren(visitor:ElementVisitor) {
    if (child != null) visitor.visit(child);
  }

  function setup() {
    #if (js && !nodejs)
    var el:js.html.Element = getObject();
 
    applyBaseStyles();

    for (style in transition.transitions) {
      el.style.setProperty(style.property, style.start);
      seed2.dom.DomTools.defer(() -> {
        el.style.setProperty(style.property, style.end);
      });
    }
    seed2.dom.DomTools.defer(registerEventListener);
    #end
  }

  function cleanup() {
    #if (js && !nodejs)
    clearListeners();
    var el:js.html.Element = getObject();
    for (cls in classes) {
      el.classList.remove(cls);
    }
    classes.resize(0);
    #end
  }

  #if (js && !nodejs)
  function applyBaseStyles() {
    var el:js.html.Element = getObject();
    var classList = [ 
      Css.atoms({ transitionDuration: transition.speed.ms() }),
      Css.atoms({ transitionProperty: list(transition.transitions.map(style -> style.property)) })
    ];

    for (cls in classList) if (!el.classList.contains(cls)) {
      classes.push(cls);
      el.classList.add(cls);
    }
  }

  function registerEventListener() {
    var el:js.html.Element = getObject();
    el.addEventListener('transitionend', onTransition);
  }

  function onTransition(e:js.html.Event) {
    if (transition.onTransition != null) transition.onTransition();
    clearListeners();
  }

  function clearListeners() {
    var el:js.html.Element = getObject();
    el.removeEventListener('transitionend', onTransition);
  }
  #end
}
