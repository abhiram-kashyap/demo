public class LeadTriggerHandler {
    
    public static void genericBeforeInsert(List<Lead> newList, Map<ID, Lead> newMap){
        
        for(Lead leadList : newList){
            
            if(leadList.salutation == null){
                leadList.firstname = 'Dr. ' + leadList.firstname;}
        }
    }

}