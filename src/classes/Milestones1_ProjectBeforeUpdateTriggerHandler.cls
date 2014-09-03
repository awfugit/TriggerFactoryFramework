public class Milestones1_ProjectBeforeUpdateTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
	
		Milestone1_Project_Trigger_Utility.handleParentProjectDates(trigger.new, trigger.oldMap);
		Milestone1_Project_Trigger_Utility.handleProjectUpdateTrigger(trigger.new);
	}
}