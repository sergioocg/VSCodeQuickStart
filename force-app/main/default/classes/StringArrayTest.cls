public class StringArrayTest {
    // Se le pasa un Integer con el nº de strings a devolver.
    // Tiene que devolver un String con el formato Test n, donde n es el nº de índice del string.
    public static List<String> generateStringArray(Integer nStrings) {
        List<String> arrayTests = new List<String>();

        for(Integer i = 0; i < nStrings; i++) {
            arrayTests.add('Test ' + i);
            
            System.debug(arrayTests.get(i));
        }
        return arrayTests;
    }
}