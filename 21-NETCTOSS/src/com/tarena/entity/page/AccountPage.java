package com.tarena.entity.page;

import java.io.Serializable;

public class AccountPage extends Page implements Serializable{

	
	private static final long serialVersionUID = 3943239977279804686L;

	
	private String idcardNo;
	private String realName;
	private String loginName;
	private String status;
	
	public String getIdcardNo() {
		return idcardNo;
	}
	public void setIdcardNo(String idcardNo) {
		this.idcardNo = idcardNo;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
