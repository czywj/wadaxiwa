package com.tarena.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6451638280409587956L;
	private String admin_code;
	private String role_name;
	private String name;
	private String telephone;
	private String email;
	private Timestamp creatime;
	public String getAdmin_code() {
		return admin_code;
	}
	public void setAdmin_code(String adminCode) {
		admin_code = adminCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String roleName) {
		role_name = roleName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getCreatime() {
		return creatime;
	}
	public void setCreatime(Timestamp creatime) {
		this.creatime = creatime;
	}
	
	
}
