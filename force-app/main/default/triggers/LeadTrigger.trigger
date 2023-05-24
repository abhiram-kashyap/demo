trigger LeadTrigger on Lead (before insert) {

    if(Trigger.isinsert && Trigger.isbefore){
        LeadTriggerHandler.genericBeforeInsert(Trigger.new , Trigger.newmap);
    }
}