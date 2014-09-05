public class Milestone1_MilestoneBeforeUpdateTrigger extends TriggerHandlerBase {
	
	public class TypedParameters 
		{
			public map<id, Milestone1_Project__c> oldMap;
			public map<id, Milestone1_Project__c> newMap;
			public list<Milestone1_Project__c> oldList;
			public list<Milestone1_Project__c> newList;
			
			public TypedParameters (TriggerParameters tpArg)
			{
				oldMap = (map<id,Milestone1_Project__c>)tpArg.oldMap;
				newMap = (map<id,Milestone1_Project__c>)tpArg.newMap;
				oldList = (list<Milestone1_Project__c>)tpArg.oldList;
				newList = (list<Milestone1_Project__c>)tpArg.newList;
				
			}
		}
		
	public override void mainEntry(TriggerParameters tpArg) {
		TypedParameters tp = new TypedParameters(tpArg);
		Milestone1_Project_Trigger_Utility.handleProjectDeleteTrigger(tp.oldList);
		
	}
}