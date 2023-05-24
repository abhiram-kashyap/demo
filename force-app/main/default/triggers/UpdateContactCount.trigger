trigger UpdateContactCount on Contact (after insert, after delete) {
    
    set<Id> AccSet = new set<Id>();
    
    if(Trigger.isinsert){
        
        for(contact con : Trigger.new){
            
            AccSet.add(con.accountID);
        }
    }
    if(Trigger.isdelete){
        
        for(contact con : Trigger.old){
            
            AccSet.add(con.accountID);
        }
    }
    
    List<Account> accList = [Select Id,name,Contact_count__c,(select ID from contacts) from account where ID in :AccSet ];
    
    list<Account> toUpdate = new list<Account>();
    
    for (account acc : accList){
        
        acc.Contact_count__c = acc.contacts.size();
        toUpdate.add(acc);
        }
    
    update toUpdate;
    

}