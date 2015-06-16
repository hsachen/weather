/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.enumeration;

/**
 *
 * @author Jean
 */
public enum MeteroElementEnum {
      
        Element_01("01","降雨"),
	Element_02("02","溫度");
	
	
	private String code;
	private String name;
	
	
	private MeteroElementEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
}
