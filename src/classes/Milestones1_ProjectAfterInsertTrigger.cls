public class Milestones1_ProjectAfterInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleKickoffDeadlineDates(Trigger.newMap, Trigger.newMap, false);
		BPMRollup.MilestoneToProjectRollup(trigger.new);
	}
}