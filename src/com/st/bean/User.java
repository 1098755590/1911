package com.st.bean;

public class User {
 private String userid;
 private String username;
 private String password;
 private String status;
public String getUserid() {
	return userid;
}
public void setUserid(String userid) {
	this.userid = userid;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
@Override
public String toString() {
	return "User [userid=" + userid + ", username=" + username + ", password=" + password + ", status=" + status + "]";
}

  
}
