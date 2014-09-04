public class Milestone1_TaskBeforeUpdateTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		
		
		Milestone1_Task_Trigger_Utility.handleTaskBeforeTrigger(tp.newList);          
        AssignedWorkManager assignedWorkManager = new AssignedWorkManager();
        AssignedWorkManager.changeTaskOwnerShipFromTask(tp.newList);
		
		Milestone1_Task_Trigger_Utility.handleMilestoneKickoffDeadline(tp.newList, tp.oldMap);
		
		Milestone1_Task_Trigger_Utility.handleStartDate(tp.newList, tp.oldMap);
         
        for(Milestone1_Task__c t : tp.newList)
            {
                if(t.Assignment__c != tp.oldMap.get(t.Id).Assignment__c)
					{t.OwnerID = t.AssignedResourceUserID__c;}
            }
			
			
			
			
	}
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
}