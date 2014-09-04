public class Milestone1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
	
		Milestone1_Milestone_Trigger_Utility.checkMilestoneManualReparent(trigger.oldMap, trigger.newMap);
		
	}
}