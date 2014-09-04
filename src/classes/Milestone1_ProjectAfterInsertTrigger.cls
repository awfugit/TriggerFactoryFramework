public class Milestone1_ProjectAfterInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleKickoffDeadlineDates(tp.newMap, tp.newMap, false);
		BPMRollup.MilestoneToProjectRollup(tp.new);
	}
}