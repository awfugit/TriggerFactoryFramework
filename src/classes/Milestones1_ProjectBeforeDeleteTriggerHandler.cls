public class Milestones1_MilestoneBeforeUpdateTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleProjectDeleteTrigger(trigger.old);
		
	}
}