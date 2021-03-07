trigger HelloWorldTrigger on Account (before insert) {
    if(Trigger.isInsert) {
        if(Trigger.isBefore) {
            System.debug('El trigger se ha lanzado antes de insertarlo en la BBDD');
        }
    }
    else {
        System.debug('Trigger NO insertado' + Trigger.isInsert);
    }
}