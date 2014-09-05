public class Milestone1_MilestoneAfterUpdateTrigger extends TriggerHandlerBase {
		public class TypedParameters 
		{
			public map<id, Milestone1_Milestone__c> oldMap;
			public map<id, Milestone1_Milestone__c> newMap;
			public list<Milestone1_Milestone__c> oldList;
			public list<Milestone1_Milestone__c> newList;
			
			public TypedParameters (TriggerParameters tpArg)
			{
				oldMap = (map<id,Milestone1_milestone__c>)tpArg.oldMap;
				newMap = (map<id,Milestone1_milestone__c>)tpArg.newMap;
				oldList = (list<Milestone1_milestone__c>)tpArg.oldList;
				newList = (list<Milestone1_milestone__c>)tpArg.newList;
				
			}
		}
		
	public override void mainEntry(TriggerParameters tpArg) {
		
		TypedParameters tp = new TypedParameters(tpArg);
		
		Milestone1_Milestone_Trigger_Utility.handleMilestoneAfterTrigger(tp.newMap);
        
		/*We do not use successors at this time commenting out....
		//shift Deadline of successor Milestones if Milestone Deadline is shifted                Milestone1_Milestone_Trigger_Utility.checkSuccessorDependencies(tp.oldMap, tp.newMap);
        //shift children Milestone dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkChildDependencies(tp.oldMap, tp.newMap);
        //shift Task dates if Milestone dates are shifted
        Milestone1_Milestone_Trigger_Utility.checkTaskDependencies(trigger.tp, tp.newMap);
		*/
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tpArg) {
		
	}
	
	public override void updateObjects() {

	}
}