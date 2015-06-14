package hxfsm.integrations.command;
import msignal.Signal;
import mmvc.api.ICommandMap;
import minject.Injector;
class CommandIntegration implements IFSMIntegration
{
    var _injector:Injector;
    var _exitSignal:Signal1<StateDef> = new Signal1<StateDef>();

    public function new(injector:Injector)
    {
        _injector = injector;
    }

    public function transition(newState:StateDef, oldState:StateDef)
    {
        if (oldState != null)
        {
            exitOldState(oldState, newState);
        }
        else
        {
            gotoNewState(newState);
        }
    }

    function exitOldState(state:StateDef, targetState:StateDef)
    {
        trace("exit: " + state.name);
        var instance:CommandState = cast state.instance;
        instance.completeSignal.addOnce(
            function()
            {
                gotoNewState(targetState);
            }
        );
        instance.exit();
    }

    function gotoNewState(state:StateDef)
    {
        trace("goto: " + state.name);

        var signal:AnySignal = new Signal0();
        _injector.mapValue(AnySignal, signal);
        var command:CommandState = cast _injector.instantiate(state.stateClass);
        _injector.unmap(AnySignal);
        state.instance = command;
        command.execute();
    }
}
