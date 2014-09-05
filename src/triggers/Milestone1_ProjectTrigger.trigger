trigger Milestone1_ProjectTrigger on Milestone1_Project__c (after insert, after update, before insert, before update, before delete, after delete) {
	if(CreateBPMProject_TriggerHandler.autoCreateProjectRunning == true)
        {return ;}
	if(SetTaskDates.isSetTaskDatesRunning==true)
		{return ;}
	TriggerFactory.createTriggerDispatcher(Milestone1_Project__c.sObjectType);
}