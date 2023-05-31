package spruce.grid;

import haxe.macro.Expr;
import haxe.macro.Context;
import pine.macro.ClassBuilder;

using StringTools;
using pine.macro.MacroTools;

function buildGeneric() {
  return switch Context.getLocalType() {
    case TInst(_, params):
      var infos = params.map(t -> switch t {
        case TInst(_.get() => { kind: KExpr(expr) }, _): 
          toGridColumnInfo(expr);
        default: 
          Context.error('Invalid expression', Context.currentPos());
      });
      return buildGridColumn(infos);
    default:
      Context.error('Invalid type params', Context.currentPos());
      throw 'assert';
  }
}

private function buildGridColumn(infos:Array<GridColumnInfo>) {
  var name = 'GridColumn_${infos.map(i -> '' + i.kind + i.span).join('_')}';
  var pack = [ 'spruce', 'grid' ];
  var path:TypePath = { pack: pack, name: name };

  if (!path.typePathExists()) {
    var pos = Context.currentPos();
    var builder = new ClassBuilder([]);
    var styles = infos.map(createStyle);
    var expr = switch styles.length {
      case 1: styles[0];
      default: macro Breeze.compose($a{styles});
    }
    
    builder.add(macro class {
      public function new(props) {
        super(props);
      }

      function getStyles():breeze.ClassName {
        return $expr;
      }
    });

    Context.defineType({
      name: name,
      pack: pack,
      pos: pos,
      kind: TDClass({
        pack: pack,
        name: 'GridColumn',
        sub: 'GridColumnBase',
        params: []
      }, null, false, true, false),
      fields: builder.export()
    });
  }

  return TPath(path);
}

private function createStyle(info:GridColumnInfo):Expr {
  return switch info.kind {
    case All: macro breeze.rule.Grid.column($v{info.span});
    case Sm: macro breeze.variant.Breakpoint.viewport('sm', breeze.rule.Grid.column($v{info.span}));
    case Md: macro breeze.variant.Breakpoint.viewport('md', breeze.rule.Grid.column($v{info.span}));
    case Lg: macro breeze.variant.Breakpoint.viewport('lg', breeze.rule.Grid.column($v{info.span}));
    case Xl: macro breeze.variant.Breakpoint.viewport('xl', breeze.rule.Grid.column($v{info.span}));
  }
}

private enum abstract GridColumnBreakpoint(String) to String {
  final All;
  final Sm;
  final Md;
  final Lg;
  final Xl;
}

private typedef GridColumnInfo = {
  public final kind:GridColumnBreakpoint;
  public final span:Int;
  public final pos:Position;
}

function toGridColumnInfo(expr:Expr):GridColumnInfo {
  return switch expr.expr {
    case EConst(CInt(span)):
      {
        kind: All,
        span: Std.parseInt(span),
        pos: expr.pos
      };
    case EConst(CString(s, _)):
      var parts = s.split(':');
      if (parts.length == 1) parts = [ 'all', parts[0] ];
      switch parts {
        case [ kind, span ]:
          { 
            kind: switch kind {
              case 'all': All;
              case 'sm': Sm;
              case 'md': Md;
              case 'lg': Lg;
              case 'xl': Xl;
              default:
                Context.error('Invalid breakpoint', expr.pos);
                All;
            }, 
            span: Std.parseInt(span),
            pos: expr.pos
          };
        default:
          Context.error('Invalid expression', expr.pos);
      }
    default:
      Context.error('Invalid expression', expr.pos);
      null;
  }
}