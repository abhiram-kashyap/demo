trigger UpdateCountOnUser on Account (after update, after delete) {

    ID userID = userinfo.getUserId();
    
    system.debug(Trigger.size);
    
    integer countUpdate = 0;
    integer countDelete = 0;
    
    if(trigger.isUpdate){
        
        countUpdate = trigger.size;
        system.debug('count update = ' + countUpdate);
    }
    
     if(trigger.isdelete){
         countDelete = trigger.size;
         system.debug('count delete = ' + countDelete);
         
    }
    
    integer count = countUpdate - countDelete;
    
    system.debug('count = '+ count);
    system.debug('countDelete = '+ countDelete);
    
    system.debug('userID = '+ userID);
    
    user u = [select Id,Count__c from user where id = :userID limit 1 ];
    
    system.debug('u = '+ u);
    system.debug('u.Count__c = '+ u.Count__c);
    
    u.Count__c += count ;
    
    update u;
    
}