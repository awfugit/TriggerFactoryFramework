public class Milestones1_ProjectAfterUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleKickoffDeadlineDates(Trigger.newMap, Trigger.oldMap, true);
		BPMRollup.MilestoneToProjectRollup(trigger.new);
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}