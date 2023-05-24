trigger ContactCreation on Account (after insert) {

    List<contact> newContact = new List<contact>();
    
    for(account acc : trigger.new){
        
        system.debug(trigger.new);
        
        system.debug(acc.Lcount__C);
        
        for(integer i=0; i< acc.Lcount__C; i++){
            
            
            Contact con= new contact();
            con.AccountId= acc.Id;
            con.LastName = 'contact'+i;
            newContact.add(con);
            
            System.debug(con);
            
        }
        if (newContact.size()>0 && newContact !=null)
        insert newContact;
    }
    
    
}