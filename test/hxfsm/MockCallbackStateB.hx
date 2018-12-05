package hxfsm;

import hxfsm.integrations.callback.ICallbackState;

class MockCallbackStateB extends hxfsm.StateBase implements ICallbackState {
    public static var entered = false;
    public function enter():Void {
        entered = true;
    }


    public function exit():Void {
        
    }
}