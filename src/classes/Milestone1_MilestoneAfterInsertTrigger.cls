public class Milestone1_MilestoneAfterInsertTrigger extends TriggerHandlerBase {
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
	
	public override void mainEntry(TriggerParameters tpArg) {
		 tp = new TypedParameters(tpArg);
		
		 Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(tp.newMap);
	}
}