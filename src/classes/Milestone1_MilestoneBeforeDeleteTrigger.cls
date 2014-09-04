public class Milestone1_MilestoneBeforeDeleteTrigger extends TriggerHandlerBase {
	
	public class TypedParameters 
		{
			public map<id, Milestone1_Milestone__c> oldMap;
			public map<id, Milestone1_Milestone__c> newMap;
			public list<Milestone1_Milestone__c> oldList;
			public list<Milestone1_Milestone__c> newList;
			
			public TypedParameters (TriggerParameters tpArg)
			{
				oldMap = tpArg.oldMap;
				newMap = tpArg.newMap;
				oldList = tpArg.oldList;
				newList = tpArg.newList;
				
			}
		}
	public override void mainEntry(TriggerParameters tp) {
		
		TypedParameters tp = new TypedParameters(tpArg);
		Milestone1_Milestone_Trigger_Utility.handleMilestoneDeleteTrigger(tp.oldMap);
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}