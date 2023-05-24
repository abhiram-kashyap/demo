trigger UpdateAccount on Account (before insert, before update) {
    
    for(account acc : trigger.new){
        
        if (acc.zone__C == null){
            
            acc.zone__C = 'India';
        }
    }

}