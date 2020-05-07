({
	getData : function(component, event, helper) {
        
		var param = {inParameter : "parameter1"};
		var startTime = performance.now();
		helper.callServer(component, "c.exampleServerCall",
			function(resultStr){ 				
				var exampleWrapper = JSON.parse(resultStr);
				if (exampleWrapper.hasError) {
					helper.log(exampleWrapper.errorMessage);
				}
				else {
					console.log('# Time taken %f', (performance.now() - startTime));
                    this.handleGetDataSuccess(component,helper, exampleWrapper);					
				}				
    		},
    		{ 
    		   "inputParam" : JSON.stringify(param)
			}/*,
			function(action){
				action.setStorable(); // Only use setStorable if the call needs to be cached.
			  }*/
		);
	},
	handleGetDataSuccess : function(component, helper, wrapper){ 
        component.set("v.exampleResult",wrapper.exampleResponse);
		return;
	}
})