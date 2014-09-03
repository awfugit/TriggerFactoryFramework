public class Milestones1_MilestoneAfterInsertTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(trigger.newMap);
	}
}