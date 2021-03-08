public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContacts, String inputLastName) {
        List<Contact> contactList = new List<Contact>();

        for(Integer i = 0; i < numContacts; i++) {
            contactList.add(new Contact(FirstName = 'Test ' + i, LastName = inputLastName));
        }

        return contactList;
    }
}