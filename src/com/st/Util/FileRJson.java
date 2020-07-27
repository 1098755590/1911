package com.st.Util;

import java.util.HashMap;
import java.util.Map;

public class FileRJson {
   private String code="0";
   private String msg="";
   private Map date=new HashMap();
   
   public FileRJson(String src) {
	   date.put("src",src);
   }
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
public String getMsg() {
	return msg;
}
public void setMsg(String msg) {
	this.msg = msg;
}
public Map getDate() {
	return date;
}
public void setDate(Map date) {
	this.date = date;
}
   
   
   
}
