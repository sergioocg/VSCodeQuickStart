public class AccountHandler {
    // 1. Insertar una nueva Account. El nombre del Account vendrá dado en el parámetro de entrada.
    // 2. Si el Account se ha insertado, debe devolver el valor del Account.
    // 3. Se le puede pasar un String vacío, así que, si ocurre una expeción DML, habrá que capturarla y devolver null.

    public static Account insertNewAccount(String accountName) {
        try {
            Account acct = new Account(Name = accountName);
            insert acct;
            
            System.debug('Insertado correctamente. \nNombre: ' + acct.Name);

            return acct;
        }catch(DmlException e) {
            System.debug(e.getMessage());
            
            return null;
        }

    }
}
