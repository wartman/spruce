package spruce.form;

import pine.*;

typedef FormContextProvider = Provider<FormContext>; 

class FormContext extends Record {
  #if (js && !nodejs)
  final form:js.html.FormElement;
  #end

  // @todo: This is where validation errors and stuff can go.
}
