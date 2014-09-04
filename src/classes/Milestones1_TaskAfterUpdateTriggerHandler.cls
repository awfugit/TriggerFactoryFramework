public class Milestone1_TaskAfterUpdateTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters trigger) {
	
		Milestone1_Task_Trigger_Utility.handleTaskAfterTrigger(trigger.newList,trigger.oldList);
        
        //Do after insert/update Rollups
        if(Test.isRunningTest() == false)
            {
                BPMRollup.TaskToAssignmentRollup(trigger.newList);  
                BPMRollup.TaskToMilestoneRollup(trigger.newList);   
            }
                
        //Check for role change and if it is null or changed, doprocesstask
        
        List<Milestone1_Task__c> listTask = new List<Milestone1_Task__c>();
                 
        for(Milestone1_Task__c a : trigger.newList)
            {
                
                if(a.Role__c != null && a.Role__c != trigger.oldMap.get(a.Id).Role__c   )
                    {listTask.add(a);}
            }
                
        if(listTask.size() > 0)
            {Trigger_MilestoneTask.DoTaskProcess(listTask);}      
        	
			
		//shift Dates of successor Tasks if Task Due Date is shifted
        Milestone1_Task_Trigger_Utility.checkSuccessorDependencies(trigger.oldMap, trigger.newMap);
        
		//Check if ETC changed, and if so update the assigned work on Assignment
        SET<ID> setTaskId = new SET<ID>();
        for(Milestone1_Task__c t : trigger.newList)
            {
                if(t.Estimated_Hours__c != trigger.oldMap.get(t.Id).Estimated_Hours__c )
                   {setTaskId.add(t.Id);}
            }
        if(setTaskId.size() > 0)
            {Milestone1_Task_Trigger_Utility.updateAssignedWork(setTaskId);}
        
            
        //Check if due date changed and if so, update the project deadline
        setTaskId = new SET<ID>();
        for(Milestone1_Task__c t : trigger.newList)
            {
                if(trigger.oldMap.get(t.Id).Due_Date__c != null  && t.Due_Date__c != trigger.oldMap.get(t.Id).Due_Date__c )
                    {setTaskId.add(t.Id);}
            }
            
        if(setTaskId.size() > 0)
            {Milestone1_Task_Trigger_Utility.updateProjectDeadline(setTaskId);}
        
	
	}
	
	
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
	
	
}