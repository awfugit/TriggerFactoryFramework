public class Milestone1_ProjectAfterDeleteTrigger extends TriggerHandlerBase {
	
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
		Milestone1_Project_Trigger_Utility.handleAfterDeleteTrigger( tp.oldList );
		BPMRollup.MilestoneToProjectRollup(tp.old);
		
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	public override void updateObjects() {

	}
}