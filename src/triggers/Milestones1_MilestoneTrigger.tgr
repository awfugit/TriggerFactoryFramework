trigger Milestones1_MilestoneTrigger on Milestones1_Milestone__c (after insert, after update, before insert, before update, before delete, after delete) {
	
	if(SetTaskDates.isSetTaskDatesRunning==true)
        {return;}
		
	TriggerFactory.createTriggerDispatcher(Milestones1_Milestone__c.sObjectType);
}