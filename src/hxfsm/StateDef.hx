package hxfsm;

class StateDef {
    public var stateClass(default, null):StateClass;
    public var transitions(default, null):Transitions;

    private var _instance:IState;
    public var instance(get, set):IState;

    private var _name:String;
    public var name(get, null):String;

    public function new(stateClass:StateClass, transitions:Transitions) {
        this.stateClass = stateClass;
        this.transitions = transitions;
    }

    public function get_instance():IState {
        if (_instance == null) {
            throw "Attempting to get instance before it was set";
        }
        return _instance;
    }

    public function set_instance(value:IState):IState {
        _instance = value;
        return _instance;
    }

    public function get_name():String {
        if (_name == null) {
            _name = Type.getClassName(stateClass);
        }
        return _name;
    }
}