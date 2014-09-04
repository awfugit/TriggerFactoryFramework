public class Milestone1_MilestoneAfterUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(tp.newMap);
        
		/*We do not use successors at this time commenting out....
		//shift Deadline of successor Milestones if Milestone Deadline is shifted                Milestone1_Milestone_Trigger_Utility.checkSuccessorDependencies(tp.oldMap, tp.newMap);
        //shift children Milestone dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkChildDependencies(tp.oldMap, tp.newMap);
        //shift Task dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkTaskDependencies(trigger.tp, tp.newMap);
		*/
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		
	}
	
	public override void updateObjects() {

	}
}