public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountsId) { // ID's de Account
        List<Account> accs = [SELECT Id, Name, Number_of_Contacts__c FROM Account WHERE Id IN :accountsId]; // Descargamos todas las Account que coincidan con los ID's pasados
        
        List<Account> accsActu = new List<Account>();
        for(Account a : accs) {
            List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId IN :accs]; // Descargo los Contact relacionados por Id con Account
            a.Number_of_Contacts__c = contacts.size();

            accsActu.add(a);
        }
        update accs;
    }
}