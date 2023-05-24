trigger UpdateLead on Lead (before insert) {

    for(Lead le : trigger.new){
        
        le.salutation += 'Dr.';
    }
}