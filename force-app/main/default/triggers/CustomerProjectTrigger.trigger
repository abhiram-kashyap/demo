trigger CustomerProjectTrigger on Customer_Project__c (after insert) {
    
    if(Trigger.isinsert && Trigger.isafter){
        
        CustomerProjectHandler.genericAfterInsert(Trigger.new, Trigger.newmap);
    }

}