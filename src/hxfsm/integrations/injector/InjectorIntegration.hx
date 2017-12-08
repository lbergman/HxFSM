package hxfsm.integrations.injector;

import hxfsm.integrations.callback.ICallbackState;
import minject.Injector;

class InjectorIntegration implements IFSMIntegration {
    var _injector:Injector;

    public function new(injector:Injector) {
        trace("new InjectorIntegration");
        _injector = injector;
    }

    public function transition(newState:StateDef, oldState:StateDef) {
        trace("transition 1");
        var newStateInstance:ICallbackState = cast Type.createInstance(newState.stateClass, []);
        trace("transition 2");
        _injector.injectInto(newStateInstance);
        trace("transition 3");
        newState.instance = newStateInstance;
        trace("transition 4");
        if (oldState != null) {
            var oldStateInstance:ICallbackState = cast oldState.instance;
            oldStateInstance.exit();
        }
        trace("transition 7:" + newStateInstance);
        newStateInstance.enter();
        trace("transition 8");
    }
}
