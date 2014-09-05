trigger Milestone1_TaskTrigger on Milestone1_Task__c (after insert, after update, before insert, before update) {
	
	
	if(SetTaskDates.isSetTaskDatesRunning==false)
        {return;}
    if(Milestone1_TaskAutoCreate_Helper.hasAlreadyLaunchedUpdateTrigger())
        {return;}
    if(AssignedWorkManager.isAssignedWorkerManagerRunning==true)
        {return;}
	
	TriggerFactory.createTriggerDispatcher(Milestone1_Task__c.sObjectType);
}