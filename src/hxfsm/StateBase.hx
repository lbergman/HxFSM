package hxfsm;

@:autoBuild(hxfsm.Macros.build())
class StateBase implements IState {
    #if display
    public static var BASE_NAME:String;
    #end
    public function new() {
    }
}
