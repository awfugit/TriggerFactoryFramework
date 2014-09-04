public class Milestone1_MilestoneBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneBeforeTrigger(trigger.new, trigger.newMap);
	}
}