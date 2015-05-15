/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.webservice;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Z00907
 */
@WebService(serviceName = "accountWebService")
public class accountWebService {

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "accountChk")
    public String accountChk(@WebParam(name = "name") String txt) {
        return "Hello " + txt + " !";
    }
}
