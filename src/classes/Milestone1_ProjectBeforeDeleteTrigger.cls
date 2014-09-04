public class Milestone1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Project_Trigger_Utility.handleProjectDeleteTrigger(tp.old);
		
	}
}