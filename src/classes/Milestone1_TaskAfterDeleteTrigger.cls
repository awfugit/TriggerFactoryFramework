public class Milestone1_TaskBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		
		
		BPMRollup.TaskToAssignmentRollup(tp.oldList);  
        BPMRollup.TaskToMilestoneRollup(tp.oldList);
		
		
	}
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
}