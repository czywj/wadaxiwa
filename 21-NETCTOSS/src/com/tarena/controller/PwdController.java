package com.tarena.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.dao.AdminMapper;
import com.tarena.dao.PwdMapper;
import com.tarena.entity.Admin;

@Controller
@RequestMapping("/pwd")
public class PwdController {
	
	@Resource
	private HttpServletRequest request;
	
	@Resource
	private AdminMapper adminMapper;
	
	@Resource
	private PwdMapper pwdMapper;

	@RequestMapping("/toUpdatePwd.do")
	public String findPwd(){
		return "pwd/modi_pwd";
	}
	
	@RequestMapping("/checkPwd.do")
	@ResponseBody
	public int checkPwd(String password) {
		System.out.println("=========");
		Admin a = (Admin) request.getSession().getAttribute("admin");
		Admin admin = adminMapper.findByCode(a.getAdmin_code());
		if(admin == null) {
			return 1;
		} else if (!admin.getPassword().equals(password)) {
			return 2;
		} else {
			return 0;
		}
	}
	
	@RequestMapping("/updatePwd.do")
	public String updatePwd(String password){
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		admin.setPassword(password);
		pwdMapper.update(admin);
		return "main/index";
	}
	
}
