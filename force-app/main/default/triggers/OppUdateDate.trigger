trigger OppUdateDate on Opportunity (after insert, after update, before delete) {

    set<Id> accId = new set<ID>();
    
    if(trigger.isinsert || trigger.isupdate){
        
        for(opportunity opp : trigger.new){
            accId.add(opp.accountId);
        }
    }
    else if(trigger.isdelete){
        for(opportunity opp : trigger.old){
            accId.add(opp.accountId);
        }
    }
    
    list<AggregateResult> res = [select max(Max_Date__c) maxdate, min(Min_Date__c) mindate, accountId from opportunity where accountId in :accId group by accountId ];
    
    list<account> acclist = new list<account>();
    
    for(AggregateResult aggRes : res){
        
        ID accID = ((ID)aggRes.get('accountId'));
        date mindate =  ((Date)aggRes.get('mindate'));
        date maxdate =  ((Date)aggRes.get('maxdate'));
        
        account acc = new account(id = accID, Max_Date__c = maxdate , Min_Date__c = mindate);
        
        acclist.add(acc);
    }
    
    update acclist;
    
}