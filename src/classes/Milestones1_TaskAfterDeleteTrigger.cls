public class Milestone1_TaskBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		
		
		BPMRollup.TaskToAssignmentRollup(trigger.oldList);  
        BPMRollup.TaskToMilestoneRollup(trigger.oldList);
		
		
	}
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
}