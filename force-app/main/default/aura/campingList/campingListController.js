({
    // Carga los items desde la base de datos de Salesforce
    doInit: function(component, event, helper) {
        // Paso 1
    	// Crea la acción llamando al método del Controller de parte del Servidor.
        let action = component.get("c.getItems");
        
    	// Paso 3
    	// Se establece que pasa cuando vuelve la llamada del método al servidor.
    	// Si el estado es SUCCESS, seteamos los valores de la respuesta en el Array
    	// items de la parte del Cliente.
        action.setCallback(this, function(response) {
            let state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });

		// Paso 2
        // Pone en cola la llamada.
        $A.enqueueAction(action);
    },    
    
    // Guarda el registro en la base de datos y actualiza el array del Cliente.
    handleAddItem: function(component, event, helper) {
       	let newItem = event.getParam("item");
        let action = component.get("c.saveItem");
        action.setParams({
            "item": newItem
        });
        action.setCallback(this, function(response){
            let state = response.getState();
            if (state === "SUCCESS") {
                let items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);        
    },
 })