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
            
            // HELPER CLASS
            // Me traigo la estructura del Array de tipo Camping_Items__c
            let arrayItems = component.get('v.items');
            
            // Convierte el objeto de JS, a una cadena de texto en JSON.
            // newItem contendrá los valores del item que le pasamos por parámetro.
            let newItem = JSON.parse(JSON.stringify(newCampingItem));
            
            // Al Array de items, le agregamos un nuevo Item.
            arrayItems.push(newItem);
            
            // Actualizamos el Array de Items del Componente, con el Array del Helper
            // que hemos ido actualizando.
            component.set('v.items', arrayItems);
            
            // Borramos el item
            component.set('v.newItem', {'sobjectType': 'Camping_Item__c',
                        'Name': '',
                        'Price__c': 0,
                        'Quantity__c': 0,
                        'Packed__c': false});
            
            // Mostramos por consola el Item que acabamos de introducir en el Array
            console.log('Item inside the Array: ' + JSON.stringify(arrayItems));
        }
    }
 })