public class Milestone1_TaskBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
		
		
		Milestone1_Task_Trigger_Utility.handleTaskBeforeTrigger(trigger.newList);          
        AssignedWorkManager assignedWorkManager = new AssignedWorkManager();
        AssignedWorkManager.changeTaskOwnerShipFromTask(trigger.newList);
		
		Milestone1_Task_Trigger_Utility.handleMilestoneKickoffDeadline(trigger.newList, trigger.oldMap);
		
		Milestone1_Task_Trigger_Utility.handleStartDate(trigger.newList, trigger.oldMap);
         
        for(Milestone1_Task__c t : trigger.newList)
            {
                if(t.Assignment__c != trigger.oldMap.get(t.Id).Assignment__c)
					{t.OwnerID = t.AssignedResourceUserID__c;}
            }
			
			
			
			
	}
	
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
}