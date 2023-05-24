trigger PreventLeadDeletion on Task (before delete) {
    
    ID profileID = userinfo.getProfileId();
    string profileName = [select Id,name from profile where ID = :profileID].name ;
    
    for (Task t : trigger.old){
        
        if(profileName == 'System Administrator'){
            
            t.addError('Cannot be deleted');
        }
    }

}