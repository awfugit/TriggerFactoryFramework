trigger Milestone1_MilestoneTrigger on Milestone1_Milestone__c (after insert, after update, before insert, before update, before delete, after delete) {
	
	if(SetTaskDates.isSetTaskDatesRunning==true)
        {return;}
		
	TriggerFactory.createTriggerDispatcher(Milestone1_Milestone__c.sObjectType);
}