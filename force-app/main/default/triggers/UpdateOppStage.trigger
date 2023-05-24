trigger UpdateOppStage on Account (after update) {

    Set<ID> accId = new set<Id>();
    
    for(account acc : trigger.new){
        
        accId.add(acc.Id);
    }
    
    list<Opportunity> oppList =[select Id,stageName,createdDate from Opportunity where accountId in : accId ];
    
    for(Opportunity opp : oppList){
        
        if(opp.stageName != 'Closed Won' && (opp.createdDate > (System.Today() - 30))){
            
        }
        
    }
    
    
}