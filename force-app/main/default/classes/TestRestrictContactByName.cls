@isTest
private class TestRestrictContactByName {
    @isTest static void TestRestrictContactByNameFalse() { // Prueba positiva, porque al probar INVALIDNAME, no hace el insert/update y devuelve un false.
        Contact c = new Contact(LastName='INVALIDNAME');
        insert c;

        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();

        System.assert(!result.isSuccess());
    }

    @isTest static void TestRestrictContactByNameTrue() { // Prueba negativa, porque al probar INVALIDNAME, no hace el insert/update y devuelve un false.
        Contact c = new Contact(LastName='Sergio');
        insert c;

        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
        Test.stopTest();

        System.assert(result.isSuccess());
    }
}