public class Milestone1_MilestoneAfterUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		Milestone1_Project_Trigger_Utility.handleAfterDeleteTrigger( trigger.old );
		BPMRollup.MilestoneToProjectRollup(trigger.old);
		
	}
	
	
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}