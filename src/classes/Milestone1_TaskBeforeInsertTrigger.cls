public class Milestone1_TaskBeforeInsertTrigger extends TriggerHandlerBase {
	
	public class TypedParameters 
		{
			public map<id, Milestone1_Task__c> oldMap;
			public map<id, Milestone1_Task__c> newMap;
			public list<Milestone1_Task__c> oldList;
			public list<Milestone1_Task__c> newList;
			
			public TypedParameters (TriggerParameters tpArg)
			{
				oldMap = (map<id,Milestone1_Task__c>)tpArg.oldMap;
				newMap = (map<id,Milestone1_Task__c>)tpArg.newMap;
				oldList = (list<Milestone1_Task__c>)tpArg.oldList;
				newList = (list<Milestone1_Task__c>)tpArg.newList;
				
			}
		}
	
	public override void mainEntry(TriggerParameters tpArg) {
		
		TypedParameters tp = new TypedParameters(tpArg);
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