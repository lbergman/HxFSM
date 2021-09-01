package hxfsm;

import hxfsm.integrations.IFSMIntegration;
import hxfsm.integrations.callback.ICallbackState;

class MockIntegration implements IFSMIntegration {
	public function new() {}

	public function transition(newState:StateDef, oldState:StateDef, update:(state:StateDef) -> Void):Void {
		var newStateInstance:ICallbackState = cast Type.createInstance(newState.stateClass, []);
		newState.instance = newStateInstance;
		if (oldState != null) {
			var oldStateInstance:ICallbackState = cast oldState.instance;
			oldStateInstance.exit();
		}
		newStateInstance.enter();
		update(newState);
	}
}
