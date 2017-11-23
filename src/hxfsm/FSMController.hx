package hxfsm;
/**
/* Controller to inject into application to perform transitions and query currentStateName
/* Injecting FSM directly to would give access to add method, but adding states should be done during initial
/* configuration. So provide access to FSMController instead to restrict usage to only the functionality needed after
/* startup.
*/
class FSMController {
    public var currentStateName(get, null):String;
    var _fsm:FSM;

    public function new(fsm:FSM) {
        _fsm = fsm;
    }

    public function goto(state:StateClass):Bool {
        return _fsm.goto(state);
    }

    function get_currentStateName():String {
        return _fsm._currentStateName;
    }
}