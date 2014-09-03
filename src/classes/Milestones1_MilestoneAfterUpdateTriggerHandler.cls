public class Milestones1_MilestoneAfterUpdateTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(trigger.newMap);
        
		/*We do not use successors at this time commenting out....
		//shift Deadline of successor Milestones if Milestone Deadline is shifted                Milestone1_Milestone_Trigger_Utility.checkSuccessorDependencies(trigger.oldMap, trigger.newMap);
        //shift children Milestone dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkChildDependencies(trigger.oldMap, trigger.newMap);
        //shift Task dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkTaskDependencies(trigger.oldMap, trigger.newMap);
		*/
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		
	}
	
	public override void updateObjects() {

	}
}