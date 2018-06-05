package hxfsm.integrations.injector;

import hex.di.Injector;

class InjectorIntegration implements IFSMIntegration {
    var _injector:Injector;

    public function new(injector:Injector) {
        _injector = injector;
    }

    public function transition(newState:StateDef, oldState:StateDef):Void {
        var newStateInstance:IInjectorState = cast _injector.instantiateUnmapped(newState.stateClass);
        newState.instance = newStateInstance;
        if (oldState != null) {
            var oldStateInstance:IInjectorState = cast oldState.instance;
            oldStateInstance.exit();
        }
        newStateInstance.enter();
    }
}
