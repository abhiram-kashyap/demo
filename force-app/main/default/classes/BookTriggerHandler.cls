public class BookTriggerHandler {

    public static void genericBeforeInsert(List<Books__c> newList , Map<ID,Books__c> newMap){
        
        for(Books__c book : newList){
            book.Currency__c = 0.9 * book.Currency__c;
        }
    }
    
    public static void genericBeforeUpdate(List<Books__c> newList ,List<Books__c> oldList, Map<ID,Books__c> newMap, Map<ID,Books__c> oldMap){
        
        for(Books__c book : newList){
            if(newMap.get(book.id).Currency__c != oldMap.get(book.id).Currency__c)
            book.Currency__c = 0.9 * book.Currency__c;
        }
        
    }
}