package hxfsm.integrations.command;

import msignal.Signal.Signal0;

interface ICommandState extends IState
{
    public var completeSignal(default, never):Signal0;
    public function exit():Void;
    public function dispose():Void;
}