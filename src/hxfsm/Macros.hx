package hxfsm;
import haxe.macro.Type.ClassType;
import haxe.macro.Expr.Field;
import haxe.macro.Context;
class Macros {
    public static function build():Array<Field>
    {
        var pos = Context.currentPos();
        var classType:ClassType = Context.getLocalClass().get();

        var name = Context.makeExpr(classType.name, pos);
        trace("name:" + name);
        var c = macro : {
            public static var BASE_NAME:String = $name;
        };

        switch (c) {
            case TAnonymous(fields):
                return Context.getBuildFields().concat(fields);
            default:
                throw 'unreachable';
        }

    }
}
