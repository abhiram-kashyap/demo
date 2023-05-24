trigger CreateAsset on OpportunityLineItem (after insert) {

    set<Id> oppID = new set<Id>();
    
    for(OpportunityLineItem oppItem : Trigger.new){
        
        oppID.add(oppItem.OpportunityId);
    }
    
    list<opportunity> oppList =[select Id,accountId from opportunity where Id in : oppID] ;
    set<Id> accID = new Set<Id>();
    
    for(opportunity opp : oppList){
        accID.add(opp.accountId);
    }
    
    for(Id acc :accID){
        
        Asset a = new Asset(name = 'New Asset',accountId = acc);
    }
}