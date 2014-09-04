public class Milestone1_ProjectBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
	
		Milestone1_Project_Trigger_Utility.handleParentProjectDates(tp.new, tp.oldMap);
		Milestone1_Project_Trigger_Utility.handleProjectUpdateTrigger(tp.new);
	}
}