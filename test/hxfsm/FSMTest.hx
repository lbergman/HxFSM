package hxfsm;

import buddy.BuddySuite;

using buddy.Should;

class FSMTest extends BuddySuite {
    public function new() {
        describe("add", {
            it("should enter state", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, []);
                controller.goto(MockInjectorState);
                controller.currentStateName.should.be("MockInjectorState");
            });
        });
    }
}
