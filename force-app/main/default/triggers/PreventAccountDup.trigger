trigger PreventAccountDup on Account (before insert, before update) {

    if(trigger.isinsert){
    
    list<string> accountName= new list<string>();
        
    for(account accList : trigger.new){
        
        accountName.add(accList.name);
        
    }
    
    
    
    list<account> existingAccounts = [select ID, name from account where name in :accountName];
    
    map<string,account> accountMap = new map<string,account>();
    
    for (account acc : existingAccounts){
        
        accountMap.put(acc.name,acc);
    }
    
    for (account acc1 :trigger.new){
        
        if(accountMap.containsKey(acc1.name)){
            
            acc1.adderror('Duplicate account not allowed');
            
        }
    }
    }
      
    
    if(trigger.isupdate){
        
        map<string,account> accountsToUpdate = new map<string,account>();
        
        for(account acc0 : trigger.new){
            accountsToUpdate.put(acc0.name,acc0);
        }
        
        List<account> existingAccounts =[select ID, name from account where name in :accountsToUpdate.keySet()];
        
        System.debug(existingAccounts);
        System.debug(trigger.new);
        
        for(account acc : trigger.new){
            for(account acc1 :existingAccounts ){
                if (acc.name == acc1.name && acc.ID <> acc1.ID){
                    acc.adderror('Duplicate update');
                }
                
            }
            
            
        }
        
    }
}