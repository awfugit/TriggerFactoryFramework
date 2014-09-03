trigger Milestones1_ProjectTrigger on Milestones1_Project__c (after insert, after update, before insert, before update, before delete, after delete) {
	// This is the only line of code that is required.
	TriggerFactory.createTriggerDispatcher(Milestones1_Project__c.sObjectType);
}