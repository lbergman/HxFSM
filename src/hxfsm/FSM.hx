package hxfsm;

import hxfsm.integrations.callback.ICallbackState;
import hxfsm.integrations.IFSMIntegration;
class FSM {
    @:allow(hxfsm.FSMController)
    var _currentStateName(get, null):String;

    var _states:Map<String, StateDef> = new Map<String, StateDef>();
    var _currentState:StateDef;
    var _integration:IFSMIntegration;
    var _enterFunc:ICallbackState -> Void;

    public function new(integration:IFSMIntegration) {
        _integration = integration;
    }

    /**
	/* Triggers a state change. Transition will only happen if stateClass is in the list
	/* of transitions for the currentState.
	/* @param stateClass - The class of the state to change to.
	*/

    @:allow(hxfsm.FSMController)
    function goto(stateClass:StateClass):Bool {
        var stateName:String = Type.getClassName(stateClass);
        var newState:StateDef = _states.get(stateName);
        var oldState:StateDef = _currentState;
        if (newState == null) {
            throw 'Attempting to transtion to $stateName, but state has not been added.';
        }
        if (oldState == null) {
            transition(newState, oldState);
            return true;
        } else if (oldState.transitions.indexOf(stateClass) != -1) {
            transition(newState, oldState);
            return true;
        } else {
            var currentStateName:String = _currentState.name;
            trace('No transition defined from $currentStateName to $stateName');
        }
        return false;
    }

    function transition(newState:StateDef, oldState:StateDef) {
        _currentState = newState;
        _integration.transition(newState, oldState);
    }

    /**
	/* Add a state with transitions to FSM.
	/*
	/* Passing the class instead of a string reference for convinience.
	/* While setting the state will be about 4X slower, and getting about 10X, it should not be a
    /* concern unless you are going to switch state thousands of times per second.
	*/

    public function add(state:StateClass, transitions:Transitions):Void {
        var stateDef:StateDef = new StateDef(state, transitions);
        var stateName:String = stateDef.name;
        if (_states.get(stateName) != null) {
            // TODO: Rather not have this as a runtime error, should be a macro for that.
            throw 'Trying to add $stateName several times. Only add states once!';
        }
        _states.set(stateName, stateDef);
    }

    function get__currentStateName():String {
        return _currentState.name;
    }
}