trigger Agreement_AutoCreateProjectTrigger on Apttus__APTS_Agreement__c (after update) {
if( Trigger.isAfter && Trigger.isUpdate )
    {   
        List<Apttus__APTS_Agreement__c> listA = new List<Apttus__APTS_Agreement__c>();
        
        for(Apttus__APTS_Agreement__c a : trigger.new ){
            if(a.Create_Project__c == true && a.Create_Project__c != trigger.oldMap.get(a.Id).Create_Project__c ){
                listA.add(a);
            }
        }
        
        if(listA.size() > 0){  
            CreateBPMProject_TriggerHandler.autoCreateProject(listA);
        }
    }
}