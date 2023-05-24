trigger preventDuplicate on Invoice__c (before insert) {
    system.debug('Abhi ');
    List<Invoice__c> incList = new List<Invoice__c>([select ID,Billing_country__c, Account__r.Name, Contact__r.FirstName, migration_ID__C from Invoice__C]);
    

    map<String,Invoice__C> incMap = new map<String,Invoice__C>();
    
    for (Invoice__C inv:incList){
        
        //String newMigrationId = (string)inv.account__C + (string)inv.contact__C + (string)inv.Billing_country__c;
        incMap.put(inv.migration_ID__C,inv);
        system.debug('Abhi incMap '+incMap);
    }
    
    //For insert operation
    if(Trigger.isbefore && Trigger.isinsert){
        system.debug('Abhi before insert');
        for (Invoice__C inv:Trigger.new){
            String newMigrationId = (string)inv.account__c + (string)inv.contact__c + (string)inv.Billing_country__c;
            system.debug('New_migration_id '+newMigrationId);
            system.debug('Abh Map '+incMap.get(newMigrationId));
            if(incMap.get(newMigrationId) != null){
                system.debug('Abhi show error');
                inv.adderror('Duplicate record');
            }
        }
    }
}