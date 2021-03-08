public class ContactSearch {
    // 1. La función debe recibir como parámetros dos Strings con el apellido y código postal.
    // 2. A través de una query, guardaremos en un List el Id y Name de todos los contactos cuyos campos coincidan con los parámetros.

    public static List<Contact> searchForContacts(String lastName, String zipCode) {
        List<Contact> contactList = [SELECT Id, Name FROM Contact WHERE lastName = :lastName AND MailingPostalCode = :zipCode];

        System.debug(contactList);

        return contactList;
    }
}