/**************************************************************************************************
* @Author:      Capgemini Australia CoE 
* @Date:        
* @Description: Base wrapper to be extended for Lightning Components  
***************************************************************************************************/
global virtual class BaseWrapper {
    
	public Parameter parameter {get; set;}
	public Result result {get; set;}
    
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:        
    * @Description: Constructor to create inner classes      
    ***********************************************************************************************/
	public BaseWrapper() {
		this.parameter = new Parameter();
		this.result = new Result();
	}
    
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE
    * @Date:        
    * @Description: This is to be used for passing parameters from Lightning components to the AEPX
    *				controller      
    ***********************************************************************************************/
	global virtual class Parameter {
		public String recordId {get; set;}
	}
	/**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:        
    * @Description: FR1: This is to be used to store the results of an action      
    ***********************************************************************************************/
	global virtual class Result {
		public Boolean hasError {get; set;} //there has been exception, show message
		public Boolean hasWarning {get; set;} //confirmation required, show message
		public Boolean hasInfo {get; set;} //success, show message
		public String message {get; set;} //the user facing message
		public String recordId {get; set;} //record id effected by an action

		/******************************************************************************************
	    * @Author:      Capgemini Australia CoE 
	    * @Date:        
	    * @Description: set boolean flags on construction	      
	    *******************************************************************************************/
		public Result() {
			this.hasError = false;
			this.hasWarning = false;
			this.hasInfo = false;
		}
	}
}