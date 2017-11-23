package hxfsm.integrations.injector;

import hxfsm.integrations.callback.ICallbackState;
import minject.Injector;

class InjectorIntegration implements IFSMIntegration {
    var _injector:Injector;

    public function new(injector:Injector) {
        _injector = injector;
    }

    public function transition(newState:StateDef, oldState:StateDef) {
        var newStateInstance:ICallbackState = cast Type.createInstance(newState.stateClass, []);
        _injector.injectInto(newStateInstance);
        newState.instance = newStateInstance;
        if (oldState != null) {
            var oldStateInstance:ICallbackState = cast oldState.instance;
            oldStateInstance.exit();
        }
        newStateInstance.enter();
    }
}
