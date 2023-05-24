trigger NewAccDup on Account (before insert, before update , before delete, after insert) {
    
    if(Trigger.isinsert && Trigger.isbefore){
        AccountHandler.beforeInsert(trigger.new,Trigger.newmap);
    }
    if(Trigger.isupdate && Trigger.isbefore){
        AccountHandler.beforeUpdate(trigger.new, Trigger.old, Trigger.newmap , Trigger.oldmap);
    }
    if(Trigger.isbefore && Trigger.isdelete){
        AccountHandler.beforedelete(Trigger.old, Trigger.oldmap);
    }
    if(Trigger.isafter && Trigger.isinsert){
        AccountHandler.afterInsert( Trigger.new, Trigger.newmap);
    }

}