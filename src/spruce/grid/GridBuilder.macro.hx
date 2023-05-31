package spruce.grid;

import haxe.macro.Context;
import haxe.macro.Expr;
import pine.macro.ClassBuilder;

using pine.macro.MacroTools;

function buildGeneric() {
  return switch Context.getLocalType() {
    case TInst(_, [ 
      TInst(_.get() => { kind: KExpr(macro $v{(columns:Int)}) }, _),
      TInst(_.get() => { kind: KExpr(macro $v{(rows:Int)}) }, _)
    ]):
      return buildGrid(Std.parseInt(columns), Std.parseInt(rows));
    case TInst(_, [ 
      TInst(_.get() => { kind: KExpr(macro $v{(columns:Int)}) }, _) 
    ]):
      return buildGrid(Std.parseInt(columns));
    default:
      Context.error('Invalid type params', Context.currentPos());
      throw 'assert';
  }
}

private function buildGrid(columns:Int, ?rows:Null<Int>) {
  var suffix = 'Col${columns}';
  if (rows != null) suffix = 'Row${rows}' + suffix;
  var name = 'Grid_${suffix}';
  var pack = [ 'spruce', 'grid' ];
  var path:TypePath = { pack: pack, name: name };

  if (!path.typePathExists()) {
    var pos = Context.currentPos();
    var builder = new ClassBuilder([]);
    
    builder.add(macro class {
      public function new(props) {
        super(props);
      }

      function getStyles():breeze.ClassName {
        return Breeze.compose(
          breeze.rule.Grid.rows($v{rows == null ? 1 : rows}),
          breeze.rule.Grid.columns($v{columns})
        );
      }
    });

    Context.defineType({
      name: name,
      pack: pack,
      pos: Context.currentPos(),
      kind: TDClass({
        pack: pack,
        name: 'Grid',
        sub: 'GridBase'
      }, null, false, true, false),
      fields: builder.export()
    });
  }

  return TPath(path);
}
