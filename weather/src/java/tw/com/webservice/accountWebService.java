/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.webservice;

import java.text.ParseException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import tw.com.entity.AccountTbl;
import tw.com.entity.AccountTblPK;
import tw.com.model.base.BaseDAO;

/**
 *
 * @author Jean
 */
@WebService(serviceName = "accountWebService")
public class accountWebService {
    
    private BaseDAO<AccountTbl> baseDao = new BaseDAO<AccountTbl>();

    /**
     * This is a sample web service operation
     */
    @WebMethod(operationName = "accountChk")
    public void accountChk(@WebParam(name = "account_group") String account_group, @WebParam(name = "user_id") String user_id,@WebParam(name = "user_name") String user_name, @WebParam(name = "email") String email,
            @WebParam(name = "uid_attr") String uid_attr, @WebParam(name = "valid_from") Date valid_from, @WebParam(name = "valid_end") Date valid_end) {
        String msg = "";
//        JSONObject json = new JSONObject();
//        JSONArray array = new JSONArray();
//        array.put("1");
//        array.put("2");
//        try {
//            json.put("friends", array);
//            return json.toString(2);
//
//        } catch (JSONException ex) {
//            Logger.getLogger(accountWebService.class.getName()).log(Level.SEVERE, null, ex);
//            return null;
//        }

        try {
            
            AccountTbl account = new AccountTbl();
            account.setAccountGroup(account_group);
            account.setEmailAddress(email);
            
            AccountTblPK accountpk = new AccountTblPK();
            accountpk.setUserId(user_id);
            account.setUserName(user_name);
            account.setAccountTblPK(accountpk);
            //     account.setUserName(request.getParameter("user_name"));
            account.setValidFrom(valid_from);
            account.setValidEnd(valid_end);
            account.setUidAttribute("1");
            baseDao.create(account);
            msg = baseDao.getMessage();
            //request.setAttribute("msg", dao);
        } catch (ParseException ex) {
            msg = "新增失敗，日期格式錯誤";
            Logger.getLogger(accountWebService.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print(ex.toString());
        } catch (Exception ex) {
            Logger.getLogger(accountWebService.class.getName()).log(Level.SEVERE, null, ex);
            System.out.print(ex.toString());
        }
        
    }
    
}
