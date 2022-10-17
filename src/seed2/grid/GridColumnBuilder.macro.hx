package seed2.core;

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
  var pack = [ 'seed2', 'grid' ];
  var path:TypePath = { pack: pack, name: name };

  if (!path.typePathExists()) {
    var pos = Context.currentPos();
    var builder = new ClassBuilder([]);
    var styles = infos.map(createStyle);
    var expr = switch styles.length {
      case 1: styles[0];
      default: macro nuke.ClassName.ofArray([ $a{styles} ]);
    }
    
    builder.add(macro class {
      static final type = new pine.UniqueId();

      public function getComponentType() {
        return type;
      }

      function getStyles():nuke.ClassName {
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
      }, [], false, true, false),
      fields: builder.export()
    });
  }

  return TPath(path);
}

private function createStyle(info:GridColumnInfo):Expr {
  var span = info.span;
  var expr = macro [ 'auto/span', $v{info.span + ''} ];

  return switch info.kind {
    case All: macro nuke.Css.atoms({ gridColumn: $expr });
    case Xs: macro seed2.core.Breakpoint.xs({ gridColumn: $expr });
    case Sm: macro seed2.core.Breakpoint.sm({ gridColumn: $expr });
    case Md: macro seed2.core.Breakpoint.md({ gridColumn: $expr });
    case Lg: macro seed2.core.Breakpoint.lg({ gridColumn: $expr });
    case Xl: macro seed2.core.Breakpoint.xl({ gridColumn: $expr });
  }
}

private enum abstract GridColumnBreakpoint(String) to String {
  final All;
  final Xs;
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
              case 'xs': Xs;
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