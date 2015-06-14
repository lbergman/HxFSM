# HxFSM
Simple FSM for Haxe. 
Contains example OpenFL project using CallbackIntegration, but is made to be framework independent.
Included is a CommandIntegration for use with mmvc.

Usage:
```javascript
// Setup FSM with CallbackIntegration
var fsm:FSM = new FSM(new CallbackIntegration());
var fsmController:FSMController = new FSMController(fsm);

// Add states with transitions
// For example, InitState can go to WelcomeState or ErrorState.
fsm.add(InitState, [WelcomeState, ErrorState]);

// Access the fsmController to make transitions or query current state name
fsmController.goto(InitState);
fsmController.goto(WelcomeState);
trace("Current state:"+fsmController.currentStateName);
```