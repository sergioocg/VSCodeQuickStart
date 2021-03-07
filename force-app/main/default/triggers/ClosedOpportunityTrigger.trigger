trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> oppTask = new List<Task>();

    for(Opportunity o : Trigger.New) {
        if(o.StageName == 'Closed Won') {
            oppTask.add(new Task(Subject = 'Follow Up Test Task', WhatId = o.Id));
        }
    }

    if (oppTask.size() > 0) {
        insert oppTask;
    }
}