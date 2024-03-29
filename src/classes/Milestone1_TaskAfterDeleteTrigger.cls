public class Milestone1_TaskAfterDeleteTrigger extends TriggerHandlerBase {
	
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
		BPMRollup.TaskToAssignmentRollup(tp.oldList);  
        BPMRollup.TaskToMilestoneRollup(tp.oldList);
		
		
	}
	
	public override void inProgressEntry(TriggerParameters tpArg) {
		System.debug('This is an example for reentrant code...');
	}
}