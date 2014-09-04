public class Milestone1_TaskAfterInsertTrigger extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {

	
	
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
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
}