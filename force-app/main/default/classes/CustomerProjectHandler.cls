public class CustomerProjectHandler {

    public static void genericAfterInsert(List<Customer_Project__c> newList, Map<ID,Customer_Project__c> newMap){
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for(Customer_Project__c cp : newList){
            if(cp.Opportunity__c != null && cp.Status__c == 'Active'){
                 Opportunity opp = new Opportunity(id=cp.Opportunity__c, Active_Customer_Project__c = true);
                opps.add(opp);
            }
        }
        update opps;
        
    }
}