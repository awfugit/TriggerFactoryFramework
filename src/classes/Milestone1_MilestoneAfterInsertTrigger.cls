public class Milestone1_MilestoneAfterInsertTrigger extends TriggerHandlerBase {
	public class TypedParameters 
		{
			public map<id, Milestone1_Milestone__c> oldMap;
			public map<id, Milestone1_Milestone__c> newMap;
			public list<Milestone1_Milestone__c> oldList;
			public list<Milestone1_Milestone__c> newList;
			
			public TypedParameters (TriggerParameters tpArg)
			{
				oldMap = (map<id,Milestone1_milestone__c)tpArg.oldMap;
				newMap = (map<id,Milestone1_milestone__c)tpArg.newMap;
				oldList = (list<Milestone1_milestone__c)tpArg.oldList;
				newList = (list<Milestone1_milestone__c)tpArg.newList;
				
			}
		}
	
	public override void mainEntry(TriggerParameters tpArg) {
		 
		 TypedParameters tp = new TypedParameters(tpArg);

		
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(tp.newMap);
	}
}