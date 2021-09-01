package hxfsm.integrations.command;

import minject.Injector;
import mmvc.api.ICommandMap;
import mmvc.impl.Command;
import msignal.Signal;

class CommandIntegration implements IFSMIntegration {
	var _injector:Injector;
	var _exitSignal:Signal1<StateDef> = new Signal1<StateDef>();

	public function new(injector:Injector) {
		_injector = injector;
	}

	public function transition(newState:StateDef, oldState:StateDef, update:(state:StateDef) -> Void) {
		if (oldState != null) {
			exitOldState(oldState, newState);
		} else {
			gotoNewState(newState);
		}
		update(newState);
	}

	function exitOldState(state:StateDef, targetState:StateDef) {
		var instance:CommandState = cast state.instance;
		instance.completeSignal.addOnce(function() {
			gotoNewState(targetState);
		});
		instance.exit();
	}

	function gotoNewState(state:StateDef) {
		var signal:AnySignal = new Signal0();
		_injector.mapValue(AnySignal, signal);
		var command:Command = cast _injector.instantiate(state.stateClass);
		_injector.unmap(AnySignal);
		state.instance = command;
		command.execute();
	}
}
