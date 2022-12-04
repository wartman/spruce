package spruce.core;

using Nuke;

@:forward
abstract BoxDecoration(ClassName) to ClassName {
  public function new(props:{
    ?padding:Spacing,
    ?margin:Spacing,
    ?borderRadius:BorderRadius
    // @todo: bg color and stuff
  }) {
    this = ClassName.ofArray([
      props.padding != null ? props.padding.toPadding() : null,
      props.margin != null ? props.margin.toMargin() : null,
      props.borderRadius != null ? props.borderRadius.toStyle() : null
    ]);
  }
}
