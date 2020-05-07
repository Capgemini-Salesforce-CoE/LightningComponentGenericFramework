({
	callServer : function(component, method, callback, params, actionAttributeCallBack) {
        var action = component.get(method);
		
        if (params) {
            action.setParams(params);
            
        }
        
        action.setCallback(this,function(response) {
            var state = response.getState();
             
            if (state === "SUCCESS") { 
                callback.call(this,response.getReturnValue());   
            } 
            else if (state === "ERROR") {
                // generic error handler
                var errors = response.getError();
                
                if (errors) {
                    console.log("Errors", errors);

                    if (errors[0] && errors[0].message) {
                        throw new Error("Error" + errors[0].message);
                    }
                } 
                else {
                    throw new Error("Unknown Error");
                }
            }
        });
        //actionAttributeParameter to set the storable/foreground/background of action from caller
        if(actionAttributeCallBack && typeof actionAttributeCallBack === "function"){
            actionAttributeCallBack(action);
        }
        
        $A.enqueueAction(action);
    },
    
    log : function(message, component){
        if(message){
            console.log(message);
        }        
    },

    showToast: function (component, event, helper, param) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": param.title,
            "type" :  param.type,
            "duration":  500 ,
            "message": param.message,
            "mode" : 'pester'
        });
        toastEvent.fire();
    }
})