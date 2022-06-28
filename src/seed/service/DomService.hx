package seed.service;

import pine.Context;
import seed.controller.BodyController;

class DomService {
  static var instance:Null<DomService> = null;

  public static function from(_:Context) {
    if (instance == null) instance = new DomService();
    return instance;
  }

  public final body:BodyController = new BodyController();

  public function new() {}
}
