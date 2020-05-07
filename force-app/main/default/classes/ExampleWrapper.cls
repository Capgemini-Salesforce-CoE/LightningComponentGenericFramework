/**************************************************************************************************
* @Author:      Capgemini Australia CoE 
* @Date:        
* @Description: Base wrapper to be extended for Lightning Components  
***************************************************************************************************/
global class ExampleWrapper extends BaseWrapper{
   
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:        
    * @Description: This is an example inner wrapper class to set parameters   
    ***********************************************************************************************/
	global class ExampleParameter extends BaseWrapper.Parameter {
        public string inParameter {get; set;}
        public String inParameter2 {get;set;}
    }
    
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE
    * @Date:        
    * @Description: This is an example inner wrapper class to store results.       
    ***********************************************************************************************/
	global class ExampleResult extends BaseWrapper.Result {
        public ExampleInnerStructure exampleResponse {get; set;}
    }
	/**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:        
    * @Description: FR1: This is to be used to store the results of an action      
    ***********************************************************************************************/
	global class ExampleInnerStructure {
        public String name {get;set;}
        public String more {get;set;}
        public String email {get;set;}
    }
}