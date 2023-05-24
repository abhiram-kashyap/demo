trigger UpdateOppAmount on Account (after update) {

    set<Id> accId = new set<ID>();
    
    for(account acc : Trigger.new){
        
        accId.add(acc.id); 
    }
    
   list<account> accList =[select Id, name ,(select Id, Amount from opportunities) from account where ID in :accId ];
    
    list<account> toUpdate = new list<account>();
    
    for(account a :accList ){
        
        decimal oppAmount =0;
        for(opportunity opp : a.opportunities)
        {
            oppAmount += opp.amount;
        }
        
        a.Total_Opp_Amount__c = oppAmount;
        
       
        toUpdate.add(a);
        
    }
    
    if(UpdateAccountOpp.firstRun){
        UpdateAccountOpp.firstRun = false;
         update toUpdate;
    }
   
}