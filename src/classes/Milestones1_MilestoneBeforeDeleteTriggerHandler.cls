public class Milestones1_MilestoneBeforeDeleteTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Milestone_Trigger_Utility.handleMilestoneDeleteTrigger(trigger.oldMap);
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}