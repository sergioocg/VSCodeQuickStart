({ // Creamos la lógica del botón y luego, en el Helper, creamos el Item
	clickCreateItem : function(component, event, helper) {
        // Obtienes un Array que hace referencia a todos los componentes del Form con el mismo ID.
        // La función reduce() convierte el Array, en componentes individuales del Form.
        let validItem = component.find('itemform').reduce(function(itemValid, currentInput) {
            
            //itemValid es un Boolean que se mantiene a True hasta que encuentra un campo erróneo.
            
            // Displays error messages for invalid fields
            currentInput.showHelpMessageIfInvalid();
            
            // get() devuelve la validez del campo que se le pasa por el parámetro currentInput.
            return itemValid && currentInput.get('v.validity').valid;            
        }, true);
        
        // If we pass error checking, do some real work
        if(validItem){
            // Nos traemos un objeto newCampingItem (que estará vacío), con todos sus campos.
            let newCampingItem = component.get("v.newItem");
            
            // Before create the Item, muestra el objeto en forma de cadena en JSON.
            // console.log("Item: " + JSON.stringify(newItem));
 
           	// Llamada al Helper para crear el Item.
           	helper.createItem(component, newCampingItem);         
        }
    },
})