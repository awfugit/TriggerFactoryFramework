public class Milestone1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		Milestone1_Project_Trigger_Utility.handleProjectDeleteTrigger(trigger.old);
		
	}
}