public class Milestone1_MilestoneBeforeDeleteTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		Milestone1_Milestone_Trigger_Utility.handleMilestoneDeleteTrigger(trigger.oldMap);
	}
	
	
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}