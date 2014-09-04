public class Milestone1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
	
		Milestone1_Milestone_Trigger_Utility.checkMilestoneManualReparent(tp.oldMap, tp.newMap);
		
	}
}