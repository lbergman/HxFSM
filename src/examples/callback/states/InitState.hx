package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class InitState implements ICallbackState
{
    public function enter()
    {
        trace("Enter Init");
    }

    public function exit()
    {
        trace("Exit Init");
    }
}
