package hxfsm.integrations.injector;

import hxfsm.IState;

interface IInjectorState extends IState extends hex.di.IInjectorContainer {
    @:keep public function enter():Void;
    @:keep public function exit():Void;
}