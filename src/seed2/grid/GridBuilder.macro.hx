package seed2.grid;

import haxe.macro.Expr;
import haxe.macro.Context;
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
  var pack = [ 'seed2', 'grid' ];
  var path:TypePath = { pack: pack, name: name };

  if (!path.typePathExists()) {
    var pos = Context.currentPos();
    var builder = new ClassBuilder([]);
    
    builder.add(macro class {
      static final type = new pine.UniqueId();

      public function getComponentType() {
        return type;
      }

      function getStyles():nuke.ClassName {
        return nuke.Theme.define({
          seed2: {
            grid: {
              rows: $v{rows == null ? 1 : rows},
              columns: $v{columns}
            }
          }
        });
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
      }, [], false, true, false),
      fields: builder.export()
    });
  }

  return TPath(path);
}
