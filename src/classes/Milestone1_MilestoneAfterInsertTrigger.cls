public class Milestone1_MilestoneAfterInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(tp.newMap);
	}
}