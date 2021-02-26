public class ContactAndLeadSearch {
    // 1. El método debe aceptar un parámetro de entrada con el dato a buscar.
    // 2. El dato de entrada se debe buscar en los NAME FIELDS porque queremos el buscar por "Nombre OR Apellido".
    // 3. Guardaremos los Contacts y Leads en un List of List y lo devolvemos.
    public static List<List<SObject>> searchContactsAndLeads(String inputParameter) {
        List<List<SObject>> contactsAndLeds = [FIND :inputParameter IN NAME FIELDS RETURNING Contact(Name), Lead(Company)];
        
        Contact[] cont = (Contact[])contactsAndLeds[0];
        Lead[] lead = (Lead[])contactsAndLeds[1];

        // Código para comprobar que funciona
        System.debug('Found the following Contacts.');
        for(Contact c : cont ) {
            System.debug(c.Name);
        }

        System.debug('Found the following Leads.');
        for(Lead l : lead ) {
            System.debug(l.Company);
        }

        return contactsAndLeds;
    }
}
