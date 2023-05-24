trigger UpdateOpp on Customer_Project__c (after insert) {

    List<opportunity> opp = new List<opportunity>();
    
    for(Customer_Project__c cp : trigger.new){
        
        if (cp.status__C == 'Active') {
            
            opportunity opp1 = new opportunity();
            opp1.id = cp.opportunity__C;
            opp1.Active_Customer_Project__c = True;
            
            opp.add(opp1);
        }
                                            }
    
    update opp;
}