public class Milestone1_ProjectBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleParentProjectDates(tp.new, tp.oldMap);
		
	}
}