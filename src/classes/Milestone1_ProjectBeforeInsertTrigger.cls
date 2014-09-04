public class Milestone1_ProjectBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		Milestone1_Project_Trigger_Utility.handleParentProjectDates(trigger.new, trigger.oldMap);
		
	}
}