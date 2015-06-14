package examples.callback.states;

import hxfsm.integrations.callback.ICallbackState;

class PlayState implements ICallbackState
{
    public function enter()
    {
        trace("Enter Play");
    }

    public function exit()
    {
        trace("Exit Play");
    }
}
