/**************************************************************************************************
* @Author:      Capgemini Australia CoE  
* @Date:       
* @Description: This is a EXAMPLE for this class used for Example lightning component
***************************************************************************************************/
public with sharing class ExampleController {
	
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:       
    * @Description: Example Server Call
    * @param: It will only accept serialized string from helper js
    ***********************************************************************************************/
    @AuraEnabled
    public static String exampleServerCall(String inputParam) {        
        ExampleWrapper.ExampleResult result = new  ExampleWrapper.ExampleResult();

        try{
            ExampleWrapper.ExampleParameter exampleParam = deserializeParameter(inputParam);
            result = fetchData(exampleParam.inParameter);  
        }
        catch(Exception ex){
            result.hasError = true;            
            result.message = 'Error Occured :: ' + ex.getMessage() + ' :: ' + ex.getLineNumber()+' :: '+ ex.getCause() + ' :: '+ex.getStackTraceString();
        }

        return JSON.serialize(result);
    }
    
    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:       
    * @Description: Method to deserialize string 
    ***********************************************************************************************/
    private static ExampleWrapper.ExampleParameter deserializeParameter(String inputParam) {
        //i: below is how you deserialise JSON to a wrapper
        //i: note that the line has been formated into mulitaple lines to aid readability
        ExampleWrapper.ExampleParameter inParam = (ExampleWrapper.ExampleParameter) JSON.deserialize(
            inputParam, 
            ExampleWrapper.ExampleParameter.class
        );
        
        return inParam;
    }

    /**********************************************************************************************
    * @Author:      Capgemini Australia CoE  
    * @Date:       
    * @Description: MUST BE AT PROVIDER 
    ***********************************************************************************************/
    private static ExampleWrapper.ExampleResult fetchData(string inParam) {
        ExampleWrapper.ExampleResult result = new ExampleWrapper.ExampleResult();
        ExampleWrapper.ExampleInnerStructure exampleStructure = new ExampleWrapper.ExampleInnerStructure();
        //Hard coding Response
        exampleStructure.name = 'Henry Connor';
        exampleStructure.more = 'Melbourne, Capgemini';
        exampleStructure.email = 'henry@capgemini.com';
        result.exampleResponse = exampleStructure;
        
        return result;
    }
}
