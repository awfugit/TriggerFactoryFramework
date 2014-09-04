public class Milestone1_TaskBeforeInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		
		
		Milestone1_Task_Trigger_Utility.handleTaskBeforeTrigger(trigger.newList);          
        AssignedWorkManager assignedWorkManager = new AssignedWorkManager();
        AssignedWorkManager.changeTaskOwnerShipFromTask(trigger.newList);
		
		Milestone1_Task_Trigger_Utility.handleKickoffDeadlineDates(trigger.newList);
		
		Milestone1_Task_Trigger_Utility.handleMilestoneKickoffDeadline(trigger.newList, trigger.oldMap);
		
		
	}
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
}