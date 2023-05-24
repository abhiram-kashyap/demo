trigger ClientContact on Account (after insert) {

    List<contact> conList = new list<contact>();
    
    for(Account acc : trigger.new){
        
        string e = acc.name + '@test.com';
        contact con = new contact(Email= e ,lastname = acc.name, accountid =acc.id);
        
		conList.add(con);        
    }
    
    system.debug('conList = ' + conList);
    
    list<Database.saveResult> res = Database.insert (conList,false);
    
    system.debug('Result = ' + res);
    
    set<Id> conId = new set<Id>();
    
    for(Database.saveResult sr : res){
        
        conId.add(sr.getId());
    }
    
    list<contact> insertedConList = [select Id, accountId from contact where ID in :conId ];
    
    list<account> accList = new list<account>();
    
    for (contact con1 : conList){
        
        account a = new account(id= con1.accountId, client_contact__C = con1.id);
        accList.add(a);
    }
    
    update accList;
}