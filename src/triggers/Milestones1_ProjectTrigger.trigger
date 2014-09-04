trigger Milestones1_ProjectTrigger on Milestones1_Project__c (after insert, after update, before insert, before update, before delete, after delete) {
	
	if(SetTaskDates.isSetTaskDatesRunning==true)
		{return ;}
	TriggerFactory.createTriggerDispatcher(Milestones1_Project__c.sObjectType);
}