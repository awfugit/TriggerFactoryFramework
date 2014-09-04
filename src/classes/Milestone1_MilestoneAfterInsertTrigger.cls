public class Milestone1_MilestoneAfterInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(trigger.newMap);
	}
}