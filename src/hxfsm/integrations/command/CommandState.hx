package hxfsm.integrations.command;

import Type.ValueType;
import com.netent.livecasino.core.controller.AsyncCommand;
import msignal.Signal.Signal0;
import mmvc.api.ICommand;
import com.netent.livecasino.core.controller.CommandSequence;

class CommandState extends AsyncCommand implements ICommandState
{
    public var proceedState:StateClass;

    var _view:SpriteView;
    var _commandSequence:CommandSequence;

    private function new()
    {
        super();
    }

    override public function execute()
    {
        _view = cast contextView;
        _commandSequence = new CommandSequence(injector);
        super.execute();
    }

    public function addCommand(command:Class<ICommand>, payload:Dynamic, ?type:Class<Dynamic> = null)
    {
        if (type == null)
        {
            // This wil work for most payloads, inluding String
            type = Type.getClass(payload);
            if (type == null)
            {
                // If it doesn't we are probably dealing with an Int or Bool
                var valueType:ValueType = Type.typeof(payload);
                switch(valueType)
                {
                    case ValueType.TInt:
                        type = cast Int;
                    case ValueType.TBool:
                        type = cast Bool;
                    default:
                        throw "Attempting to use unsupported type as payload: " + valueType;
                }
            }
        }
        _commandSequence.add(command, payload, type);
    }

    public function run()
    {
        _commandSequence.completeSignal.addOnce(onComplete);
        _commandSequence.run();
    }

    public function exit()
    {
        dispose();
    }

    public function dispose()
    {
        _commandSequence.dispose();
        _commandSequence = null;
        completeSignal.dispatch();
    }

    function onComplete()
    {
        if (proceedState != null)
        {
            fsmController.goto(proceedState);
        }
    }
}
