public class Milestones1_MilestoneBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneBeforeTrigger(trigger.new, trigger.newMap);
	}
}