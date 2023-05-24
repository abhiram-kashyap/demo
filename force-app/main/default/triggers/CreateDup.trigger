trigger CreateDup on Lead (after insert) {

       list<Lead> leadList = new list<Lead>();
    
    for(Lead l : trigger.new){
        
        Lead le = l.clone();
        
		leadList.add(le);
    }
    
    if(LeadHandler.firstRun == true){
        LeadHandler.firstRun = false;
        insert leadList;
        
    }
    
    
}