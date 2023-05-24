trigger PicklistCheck on OpportunityLineItem (before insert, before update) {
    
    set<Id> OPPID = new set<Id>();
    for(OpportunityLineItem oppli : trigger.new){
        
		 OPPID.add(oppli.opportunityid);        
    }
    
    
    map<ID,Opportunity> oppMap = new map<ID,Opportunity> ([select Id, Product_Family__c from Opportunity where id in :OPPID]);
       
     for(OpportunityLineItem oppli1 : trigger.new){
        
        if(oppli1.Product_Family__c != oppMap.get(oppli1.opportunityid).Product_Family__c){
            
            oppli1.addError('Family not matching');
        }
    }

}