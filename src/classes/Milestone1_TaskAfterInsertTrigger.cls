public class Milestone1_TaskAfterInsertTrigger extends TriggerHandlerBase {
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
                if(a.Role__c != null  )
                    {listTask.add(a);}
				
            }
                
        if(listTask.size() > 0)
            {Trigger_MilestoneTask.DoTaskProcess(listTask);}      
        
	}
	
	public override void inProgressEntry(TriggerParameters trigger) {
		System.debug('This is an example for reentrant code...');
	}
}