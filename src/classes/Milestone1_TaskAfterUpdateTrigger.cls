public class Milestone1_TaskAfterUpdateTrigger extends TriggerHandlerBase {
	
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
                
                if(a.Role__c != null && a.Role__c != tp.oldMap.get(a.Id).Role__c   )
                    {listTask.add(a);}
            }
                
        if(listTask.size() > 0)
            {Trigger_MilestoneTask.DoTaskProcess(listTask);}      
        	
			
		//shift Dates of successor Tasks if Task Due Date is shifted
        Milestone1_Task_Trigger_Utility.checkSuccessorDependencies(tp.oldMap, tp.newMap);
        
		//Check if ETC changed, and if so update the assigned work on Assignment
        SET<ID> setTaskId = new SET<ID>();
        for(Milestone1_Task__c t : tp.newList)
            {
                if(t.Estimated_Hours__c != tp.oldMap.get(t.Id).Estimated_Hours__c )
                   {setTaskId.add(t.Id);}
            }
        if(setTaskId.size() > 0)
            {Milestone1_Task_Trigger_Utility.updateAssignedWork(setTaskId);}
        
            
        //Check if due date changed and if so, update the project deadline
        setTaskId = new SET<ID>();
        for(Milestone1_Task__c t : tp.newList)
            {
                if(tp.oldMap.get(t.Id).Due_Date__c != null  && t.Due_Date__c != tp.oldMap.get(t.Id).Due_Date__c )
                    {setTaskId.add(t.Id);}
            }
            
        if(setTaskId.size() > 0)
            {Milestone1_Task_Trigger_Utility.updateProjectDeadline(setTaskId);}
        
	
	}
	
	
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
	
	
}