package hxfsm.integrations.injector;

interface IInjectorState extends IState {
    @:keep public function enter():Void;
    @:keep public function exit():Void;
}