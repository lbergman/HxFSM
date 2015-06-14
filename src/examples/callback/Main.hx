package examples.callback;

import examples.callback.states.EndState;
import examples.callback.states.PlayState;
import examples.callback.states.RegisterState;
import examples.callback.states.WelcomeState;
import examples.callback.states.ErrorState;
import examples.callback.states.InitState;
import hxfsm.FSMController;
import hxfsm.FSM;
import hxfsm.integrations.callback.CallbackIntegration;
import openfl.display.Sprite;

class Main extends Sprite
{
    public function new()
    {
        super();
        // Setup FSM using CallbackIntegration
        var fsm:FSM = new FSM(new CallbackIntegration());
        var fsmController:FSMController = new FSMController(fsm);

        // Add states and transitions
        fsm.add(InitState, [WelcomeState, ErrorState]);
        fsm.add(WelcomeState, [RegisterState, PlayState]);
        fsm.add(RegisterState, [PlayState, ErrorState]);
        fsm.add(PlayState, [EndState, ErrorState]);
        fsm.add(EndState, [PlayState]);
        fsm.add(ErrorState, []);

        // go to initial state
        fsmController.goto(InitState);

        // Test some transitions. Normally you would inject fsmController somehow to the parts of your application
        // which controls the flow.
        fsmController.goto(WelcomeState);
        fsmController.goto(RegisterState);
        fsmController.goto(PlayState);
        fsmController.goto(EndState);
    }
}