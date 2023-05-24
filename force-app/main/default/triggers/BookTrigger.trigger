trigger BookTrigger on Books__c (before insert, before update) {

    if(Trigger.isbefore && Trigger.isinsert){
        
        BookTriggerHandler.genericBeforeInsert(Trigger.new , Trigger.newmap);
    }
    
     if(Trigger.isbefore && Trigger.isupdate){
         
        BookTriggerHandler.genericBeforeUpdate(Trigger.new , Trigger.old, Trigger.newmap ,Trigger.oldmap);
    }
}