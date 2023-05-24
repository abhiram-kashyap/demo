trigger PreventDuplicateContact on Contact (before insert, before update) {

    map<string,string> conmap = new map<string,string> ();
    
    for(contact con : trigger.new){
        
       conmap.put(con.Title,con.Email);
    }
    
    list<contact> conlist = [select ID,Title,email from contact where email in :conmap.values() and Title in :conmap.keySet()];
    
    if(conlist.size()>0){
  for(contact con1 : trigger.new){
      for (contact con2 : conlist){
       
           if(con1.Title==con2.Title && con1.email==con2.email){
          con1.adderror('Duplicate Email and Firstname not allowed');
      }
  
     
      }
      
  }
}
}