package seed;

import pine.*;
import pine.html.*;
import seed.CollapseContext;

class CollapseGroup extends ImmutableComponent {
  public function render(context:Context) {
    return new CollapseContextProvider({
      create: () -> new CollapseContext(),
      dispose: collapse -> collapse.dispose(),
      render: collapse -> new Html<'div'>({}) // todo
    });
  }
}
