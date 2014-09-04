public class Milestones1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
	
		Milestone1_Milestone_Trigger_Utility.checkMilestoneManualReparent(trigger.oldMap, trigger.newMap);
		
	}
}