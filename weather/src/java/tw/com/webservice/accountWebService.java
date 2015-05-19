/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.webservice;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

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
    public String accountChk(@WebParam(name = "account_group") String account_group, @WebParam(name = "user_id") String user_id, @WebParam(name = "email") String email,
            @WebParam(name = "uid_attr") String uid_attr, @WebParam(name = "valid_from") String valid_from, @WebParam(name = "valid_end") String valid_end) {
        JSONObject json = new JSONObject();
        JSONArray array = new JSONArray();
        array.put("1");
        array.put("2");
        try {
            json.put("friends", array);
            return json.toString(2);

        } catch (JSONException ex) {
            Logger.getLogger(accountWebService.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }

    }

}
