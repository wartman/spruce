package seed2.dom;

private final hasRaf:Bool = js.Syntax.code("typeof window != 'undefined' && 'requestAnimationFrame' in window");

function defer(exec:() -> Void) {
  if (hasRaf)
    js.Syntax.code('window.requestAnimationFrame({0})', time -> {
      js.Browser.window.requestAnimationFrame(_ -> exec());
    }); 
  else
    haxe.Timer.delay(() -> exec(), 10);
}

