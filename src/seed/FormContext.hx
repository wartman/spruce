package seed;

import pine.*;

typedef FormContextProvider = Provider<FormContext>;

class FormContext implements Record {
  public static inline function from(context:Context) {
    return FormContextProvider.from(context);
  }

  public static inline function maybeFrom(context:Context) {
    return FormContextProvider.maybeFrom(context);
  }

  @track public var isSubmitted:Bool;
  @track public var isValidating:Bool;
  // etc
}
