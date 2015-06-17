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
      
        Element_10("10","降水"),
	Element_11("11","氣溫"),
        Element_12("12","風力");
	
	
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
