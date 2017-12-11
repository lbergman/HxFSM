package hxfsm.integrations.injector;

import minject.Injector;

class InjectorIntegration implements IFSMIntegration {
    var _injector:Injector;

    public function new(injector:Injector) {
        _injector = injector;
    }

    public function transition(newState:StateDef, oldState:StateDef):Void {
        var newStateInstance:IInjectorState = cast Type.createInstance(newState.stateClass, []);
        _injector.injectInto(newStateInstance);
        newState.instance = newStateInstance;
        if (oldState != null) {
            var oldStateInstance:IInjectorState = cast oldState.instance;
            oldStateInstance.exit();
        }
        newStateInstance.enter();
    }
}
