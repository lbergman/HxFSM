package hxfsm.integrations;
interface IFSMIntegration
{
    public function transition(newState:StateDef, oldState:StateDef):Void;
}
