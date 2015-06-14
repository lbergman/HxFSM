package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class EndState implements ICallbackState
{
    public function enter()
    {
        trace("Enter End");
    }

    public function exit()
    {
        trace("Exit End");
    }
}
