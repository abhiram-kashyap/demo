public class AccountHandler {
    
    
    public static void beforeInsert(List<Account> newList , Map<ID,Account> newMap)
    {
            system.debug('Testing back flow');

     List<string> accNames = new List<string>();
        for(Account acc : newList){
            accNames.add(acc.Name);
                system.debug('test Hello');
            if (acc.Sample_Text__c == null){
                acc.Sample_Text__c = 'Welcome';
            }
        }
     List<Account> accList =[select Id,name from Account where name in :accNames];
        for(Account acc1 : newList){
            for(Account acc2 : accList){
                if(acc1.name == acc2.Name){
                   acc1.addError ('Duplicate Account creation not allowed');
                }
            }
           
        }
    }

     public static void beforeUpdate(List<Account> newList ,List<Account> oldList, Map<ID,Account> newMap , Map<ID,Account> oldMap )
    {
        List<string> accNames = new List<string>();
        for(Account acc : newList){
            accNames.add(acc.Name);
        }
     List<Account> accList =[select Id,name from Account where name in :accNames];
        for(Account acc : newList){
            for(Account acc1 : accList){
                if(acc.id != acc1.id && acc.Name == acc1.Name){
                  acc.addError('Dup Uppdate not allowed');
                }
            }
        }
    }
    
    public static void beforedelete(List<Account> oldList , Map<ID, Account> oldMap){
        
        for(Account acc : oldList){
            
            acc.addError('Account cannot be deleted');
        }
    }
    
    public static void afterInsert(List<Account> newList, Map<ID, Account> newMap){
        
        List<Contact> conList = new List<Contact>();
        
        for(Account acc : newList){
            if(acc.Locations_count__c > 0){
            for( integer i = 0 ; i < acc.Locations_count__c; i++){
                
                string name = 'Hari';
                string mail = 'harilal';
                contact con = new contact(lastname = name + (i+1),AccountId = acc.id, email =mail+(i+1)+'@gmail.com');
                conList.add(con);
            }
            }
        }
        insert conList;
    }
}
