package hxfsm.integrations.callback;
interface ICallbackState extends IState
{
    public function enter():Void;
    public function exit():Void;
}
