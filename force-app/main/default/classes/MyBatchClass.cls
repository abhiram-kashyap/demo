global class MyBatchClass implements Database.Batchable<sObject> {

    global boolean sample;
    global string query;
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        if(sample){
            
            query = 'select id, name from Account limit 2000';
		 }
        else if(!sample){
            
            query ='select id, name from contact limit 2000';
        }
        
        return Database.getQueryLocator(query);
        
    }
    
    public void execute(Database.BatchableContext bc, List<Account> scope){
        
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}