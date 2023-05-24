trigger NotifyOwner on Account (after update) {
    
    string accountFieldLabel = Label.Account_Fields ;
    list<string> accountFields = accountFieldLabel.split(',');
    set<ID> OwnerID = new set<ID>();
    map<ID, Account> oldMap = new map<ID, Account>();
    map<ID, Account> newMap = new map<ID, Account>();
    for(account a : trigger.new){
        OwnerID.add(a.ownerID);
        newMap.put(a.ID, a);
    }
     for(account a : trigger.old){
        oldMap.put(a.ID, a);
    }
    
    map<Id,user> userMap = new map<Id,user>([Select Id, email from user where Id in :OwnerID]);
    List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
    
    if(trigger.old != trigger.new){
        
        for (account acc : trigger.new){
         
            List<String> accOwners = new List<String>();
            string accOwner = userMap.get(acc.OwnerId).email ;
            accOwners.add(accOwner);
            for(string accountField : accountFields ){
                
                //if(newMap.get(acc.ID).accountField )
                
            }
            System.debug('Old Values ' + trigger.old );
            System.debug('New Values ' + trigger.new );
            Messaging.SingleEmailMessage msg= new Messaging.SingleEmailMessage();
            msg.setToAddresses(accOwners);
            msg.setSubject('Acount updated');
            msg.setPlainTextBody('Values changed from' + trigger.old + 'to' + trigger.new);
            emails.add(msg);
            
        }
        
    }
    
    Messaging.sendEmail(emails);

}