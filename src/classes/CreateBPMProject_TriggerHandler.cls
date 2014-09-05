public with sharing class CreateBPMProject_TriggerHandler{
	
	public static boolean autoCreateProjectRunning=false;
	public static boolean isAutoCreateRunning(){return autoCreateProject;}
    public static void autoCreateProject( List<Apttus__APTS_Agreement__c> agreements ) {
          autoCreateProjectRunning=true;
                        
        for(Apttus__APTS_Agreement__c a : agreements ){
            
            Milestone1_Project__c pparent = new Milestone1_Project__c();
            
			
            for(RecordType rt: [Select Id From RecordType Where Name = 'Parent' AND SObjectType = 'Milestone1_Project__c']){
                pparent.RecordTypeId = rt.Id;
            }
            		
			
			Project_Template__c MasterProjectTemplate = [Select Id,Baseline_Duration__c,Baseline_Effort__c From Project_Template__c Where Master_Admin__c = true Limit 1];
             
				
            pparent.Name = 'Master ' + system.now().format('yyyyMMddhhmmss');
            pparent.Opportunity1__c = a.Apttus__Related_Opportunity__c;
            pparent.Account__c = a.Apttus__Account__c;
            pparent.Agreement__c = a.Id;
            pparent.Project_Template__c = MasterProjectTemplate.Id;
			if(MasterProjectTemplate.Baseline_Duration__c != null ){
                    pparent.Total_Estimated_Duration_Days__c = MasterProjectTemplate.Baseline_Duration__c;
                }
                if(MasterProjectTemplate.Baseline_Effort__c != null ){
                    pparent.Total_Hours_Budget__c = MasterProjectTemplate.Baseline_Effort__c;
                }
            
			insert pparent;
            
			system.debug('=====' + pparent.Id);
			
			 // create Milestone1_Milestone__c 
             
            SET<string> setPhase = new SET<string>();
            
            
            List<Related_Task__c> listRelatedTasks = [Select Id,Predecessor__c,Task_Detail__c,Set_Predecessor__c,Product_Name__c,Key__c,Name,Seq__c,Task__c, f_Phase__c,f_Role__c,f_Duration__c,f_Days_After_Start__c,f_Days_Before_End__c,f_Effort__c 
                                                        From Related_Task__c Where Project_Template__c =: MasterProjectTemplate.Id  AND f_Phase__c != null Order By f_Duration__c DESC, f_Effort__c DESC];
            
            for(Related_Task__c rt: listRelatedTasks){ 
                    setPhase.add(rt.f_Phase__c); 
                    
            }
            
            
            List<Milestone1_Milestone__c> listM = new List<Milestone1_Milestone__c>();
            
            for(string phase: setPhase){
                Milestone1_Milestone__c mm = new Milestone1_Milestone__c();
                
                mm.Name = phase;
                mm.Project__c = pparent.Id;
                
                if(phase.contains('Planning')){
                    mm.Sequence__c = 1;
                }
                if(phase.contains('Build')){
                    mm.Sequence__c = 2;
                }
                if(phase.contains('Test')){
                    mm.Sequence__c = 3;
                }
                if(phase.contains('Train')){
                    mm.Sequence__c = 4;
                }
                if(phase.contains('Go Live')){
                    mm.Sequence__c = 5;
                }
                if(phase.contains('Transition')){
                    mm.Sequence__c = 6;
                }
                
                listM.add(mm);  
            }
            
            if(listM.size() > 0){
                upsert listM;
            }
            
			
			
			
			MAP<string,Id> mapMilestonePhase = new MAP<string,Id>();
            for(Milestone1_Milestone__c mm : listM){
                mapMilestonePhase.put(mm.Name, mm.Id);
            }
            
            // create Milestone1_Tasks
            
            List<Milestone1_Task__c> listMT = new List<Milestone1_Task__c>();
            
            SET<string> setTaskUniqueName = new SET<string>();
            
             
            SET<ID> setPDMilestone = new SET<ID>();
            SET<double> setPredecessor = new SET<double>();
            
            for(Related_Task__c rt: listRelatedTasks){
                
                if(setTaskUniqueName.contains(rt.Key__c) == false ){
                    Milestone1_Task__c mt = new Milestone1_Task__c();
                     
                    mt.Name = rt.Task__c;             
                    mt.Project_Milestone__c = mapMilestonePhase.get(rt.f_Phase__c);
                    mt.Role__c = rt.f_Role__c;
                    mt.Duration_Days__c = rt.f_Duration__c;
                    mt.Estimated_Hours__c = rt.f_Effort__c;
                    mt.Estimated_Time_To_Complete__c= rt.f_Effort__c;
                    mt.Days_After_Start__c = rt.f_Days_After_Start__c;
                    mt.Days_Before_End__c = rt.f_Days_Before_End__c;
                    mt.Sequence__c = rt.Seq__c;
                    mt.Related_Product_s__c = rt.Product_Name__c;
                    mt.Task_Detail__c = rt.Task_Detail__c;
                    
                    if(rt.Predecessor__c != null ){
                        mt.Predecessor_Sequence__c = rt.Predecessor__c;
                    }
                    
                    
                    if(rt.Predecessor__c != null){
                        setPredecessor.add(rt.Predecessor__c);
                    }
                    setPDMilestone.add(mt.Project_Milestone__c);
                    
                    listMT.add(mt);
                    
                    setTaskUniqueName.add(rt.Key__c);
                }
            }
            
            if(listMT.size() > 0){
                upsert listMT;
            }
			
			 List<Milestone1_Task__c> listPredecessorTask = [Select Id,Project_Milestone__c,Sequence__c From Milestone1_Task__c Where Sequence__c IN: setPredecessor AND Project_Milestone__c IN: setPDMilestone];
           
            List<Milestone1_Task__c> lstMTUpdate = new List<Milestone1_Task__c>();
            
            for(Milestone1_Task__c mt: listMT){ 
                if(mt.Predecessor_Sequence__c != null ){
                    for(Milestone1_Task__c mm: listPredecessorTask){
                        if(mm.Sequence__c == mt.Predecessor_Sequence__c && mm.Project_Milestone__c == mt.Project_Milestone__c){
                            mt.Predecessor_Task__c = mm.Id;
                            break;
                        }
                    }
                }
            }
            
            if(listMT.size() > 0){
                update listMT;
            }
            
            SET<ID> setTskID = new SET<ID>();
            
            for(Milestone1_Task__c t : listMT){
                if(t.Id != null ){
                    setTskID.add(t.Id);
                }
            }
            
            
            List<Milestone1_Milestone__c> lstMMUpdate = new List<Milestone1_Milestone__c>();
            
            for(Milestone1_Milestone__c mm : [Select Id,Deadline__c,Kickoff__c, (Select Id,Start_Date__c,Deadline__c From Project_Tasks__r Where Start_Date__c != null AND Deadline__c != null) 
                                                From Milestone1_Milestone__c Where Id IN: listM ] ){
                
                for(Milestone1_Task__c t : mm.Project_Tasks__r){
                    if(mm.Kickoff__c == null ){
                        //mm.Kickoff__c = t.Start_Date__c;
                    }
                    else if(mm.Kickoff__c > t.Start_Date__c){
                        //mm.Kickoff__c = t.Start_Date__c;
                    }
                    
                    if(mm.Deadline__c == null ){
                        //mm.Deadline__c = t.Deadline__c;
                    }
                    else if(mm.Deadline__c < t.Deadline__c){
                        //mm.Deadline__c = t.Deadline__c;
                    }
                }
                
                lstMMUpdate.add(mm);
            }
            
            if(lstMMUpdate.size() > 0){
                update lstMMUpdate;
            }
            
            
            if(setTskID.size() > 0 && Test.isRunningTest() == false ){
                
                // Future call to update Task to fire Task rollup summary triggers
                CreateProjectFuture.DoUpdateTask(setTskID);
            }
            
			
			
        }
    }
}