package hxfsm.integrations.injector;

interface IInjectorState extends IState {
    public function enter():Void;
    public function exit():Void;
}