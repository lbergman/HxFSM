package hxfsm;

import hxfsm.integrations.callback.ICallbackState;

class MockInjectorStateB extends StateBase implements ICallbackState {
    public static var entered = false;
    public function enter() {
        entered = true;
    }
    public function exit() {
        entered = false;
    }
}
