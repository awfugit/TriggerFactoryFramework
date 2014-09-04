public class Milestone1_TaskBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		
		
		Milestone1_Task_Trigger_Utility.handleTaskBeforeTrigger(tp.newList);          
        AssignedWorkManager assignedWorkManager = new AssignedWorkManager();
        AssignedWorkManager.changeTaskOwnerShipFromTask(tp.newList);
		
		Milestone1_Task_Trigger_Utility.handleKickoffDeadlineDates(tp.newList);
		
		Milestone1_Task_Trigger_Utility.handleMilestoneKickoffDeadline(tp.newList, tp.oldMap);
		
		
	}
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
}