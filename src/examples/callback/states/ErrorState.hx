package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class ErrorState implements ICallbackState
{
    public function enter()
    {
        trace("Enter Error");
    }

    public function exit()
    {
        trace("Exit Error");
    }
}
