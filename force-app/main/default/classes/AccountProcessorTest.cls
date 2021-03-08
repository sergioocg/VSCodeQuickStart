@isTest
private class AccountProcessorTest {
    @isTest
    private static void testAssignNumberOfContacts() {
        // Test data setup
        Account a = new Account(Name='Test Account');
        Insert a;
        
        Contact c = new Contact(FirstName='Bob', LastName='Willie', AccountId=a.Id);
        Contact c1 = new Contact(FirstName='Tom', LastName='Cruise', AccountId=a.Id);  

        List<Id> bulksId = new List<Id>();
        bulksId.add(a.Id);

        Test.startTest();
        AccountProcessor.countContacts(bulksId);
        Test.stopTest();
    }
}