package hxfsm;
import hxfsm.integrations.callback.ICallbackState;
import hxfsm.integrations.IFSMIntegration;

class MockIntegration implements IFSMIntegration {
    public function new() {

    }
    public function transition(newState:StateDef, oldState:StateDef):Void {
        var newStateInstance:ICallbackState = cast Type.createInstance(newState.stateClass, []);
        newState.instance = newStateInstance;
        if (oldState != null) {
            var oldStateInstance:ICallbackState = cast oldState.instance;
            oldStateInstance.exit();
        }
        newStateInstance.enter();
    }
}
