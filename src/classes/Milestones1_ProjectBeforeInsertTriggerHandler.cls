public class Milestones1_ProjectBeforeInsertTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleParentProjectDates(trigger.new, trigger.oldMap);
		
	}
}