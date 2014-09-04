public class Milestone1_MilestoneAfterUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleAfterDeleteTrigger( tp.old );
		BPMRollup.MilestoneToProjectRollup(tp.old);
		
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}