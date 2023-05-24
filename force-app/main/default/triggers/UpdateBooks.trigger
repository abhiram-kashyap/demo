trigger UpdateBooks on Books__c (before insert, before update) {

    for(Books__C book : trigger.new){
        
        book.Currency__c *= 0.9;
    }
    
}