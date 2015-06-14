package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class RegisterState implements ICallbackState
{
    public function enter()
    {
        trace("Enter Register");
    }

    public function exit()
    {
        trace("Exit Register");
    }
}
