package hxfsm.integrations.callback;
class CallbackIntegration implements IFSMIntegration {
    public function new() {
    }

    public function transition(newState:StateDef, oldState:StateDef, enterFunc:ICallbackState -> Void) {
        var newStateInstance:ICallbackState = cast Type.createInstance(newState.stateClass, []);
        enterFunc(newStateInstance);
        newState.instance = newStateInstance;
        if (oldState != null) {
            var oldStateInstance:ICallbackState = cast oldState.instance;
            oldStateInstance.exit();
        }
        newStateInstance.enter();
    }
}