public class Milestone1_MilestoneBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneBeforeTrigger(tp.new, tp.newMap);
	}
}