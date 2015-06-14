package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class WelcomeState implements ICallbackState
{
    public function enter()
    {
        trace("Enter Welcome");
    }

    public function exit()
    {
        trace("Exit Welcome");
    }
}
