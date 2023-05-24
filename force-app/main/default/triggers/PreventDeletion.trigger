trigger PreventDeletion on Account (before delete) {
    
    for(account acc : trigger.old){
        
        acc.adderror('Account deletion is prevented');
    }

}