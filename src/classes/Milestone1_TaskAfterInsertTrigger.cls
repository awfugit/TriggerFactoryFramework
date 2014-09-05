public class Milestone1_TaskAfterInsertTrigger extends TriggerHandlerBase {
	
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
		Milestone1_Task_Trigger_Utility.handleTaskAfterTrigger(tp.newList,tp.oldList);
        
        //Do after insert/update Rollups
        if(Test.isRunningTest() == false)
            {
                BPMRollup.TaskToAssignmentRollup(tp.newList);  
                BPMRollup.TaskToMilestoneRollup(tp.newList);   
               
            }
                
                
        //Check for role change and if it is null or changed, doprocesstask
        
        List<Milestone1_Task__c> listTask = new List<Milestone1_Task__c>();
                 
        for(Milestone1_Task__c a : tp.newList)
            {
                if(a.Role__c != null  )
                    {listTask.add(a);}
				
            }
                
        if(listTask.size() > 0)
            {Trigger_MilestoneTask.DoTaskProcess(listTask);}      
        
	}
	
	public override void inProgressEntry(TriggerParameters tpArg) {
		System.debug('This is an example for reentrant code...');
	}
}