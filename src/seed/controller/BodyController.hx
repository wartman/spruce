package seed.controller;

class BodyController {
  public function new() {}

  public function lock() {
    #if (js && !nodejs)
      var body = getBody();
      var beforeWidth = body.offsetWidth;
      body.setAttribute('style', 'overflow:hidden;');
      var afterWidth = body.offsetWidth;
      var offset = afterWidth - beforeWidth;
      if (offset > 0) {
        body.setAttribute('style', 'overflow:hidden;padding-right:${offset}px');
      }
    #end
  }

  public function unlock() {
    #if (js && !nodejs)
      getBody().removeAttribute('style');
    #end
  }
  
  #if (js && !nodejs)
    public function getBody() {
      return js.Browser.document.body;
    }
  #else
    public function getBody() {
      return null;
    }
  #end
}
