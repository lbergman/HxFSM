package hxfsm;

import buddy.BuddySuite;

using buddy.Should;

class FSMTest extends BuddySuite {
    public function new() {
        describe("integration", {
            it("should enter initial state", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, []);
                controller.goto(MockInjectorState);
                MockInjectorState.entered.should.be(true);
            });

            it("should not allow entering state if transition not added", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, []);
                controller.goto.bind(MockInjectorStateB).should.throwValue("Attempting to transtion to MockInjectorStateB, but state has not been added.");
            });
            it("should only allow adding state once", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, []);
                //fsm.add(MockInjectorState, []);
                fsm.add.bind(MockInjectorState, []).should.throwValue("Trying to add MockInjectorState several times. Only add states once!");
            });
            it("should not allow entering state if transition not defined", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, []);
                fsm.add(MockInjectorStateB, []);
                controller.goto(MockInjectorState);
                controller.goto(MockInjectorStateB);
                MockInjectorStateB.entered.should.be(false);
            });
            it("should enter defined transition", {
                var fsm = new FSM(new MockIntegration());
                var controller = new FSMController(fsm);
                fsm.add(MockInjectorState, [MockInjectorStateB]);
                fsm.add(MockInjectorStateB, []);
                controller.goto(MockInjectorState);
                controller.goto(MockInjectorStateB);
                MockInjectorStateB.entered.should.be(true);
                MockInjectorState.entered.should.be(false);
            });
        });
    }
}
