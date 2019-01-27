package com.tarena.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarena.dao.UserMapper;
import com.tarena.entity.Admin;
import com.tarena.entity.Role;

@Controller
@RequestMapping("/user")
public class UserController{
	
	@Resource
	private UserMapper userMapper;
	
	@Resource
	private HttpServletRequest request;
	
	@RequestMapping("/findUser.do")
	public String find(Model model){
		Admin a = (Admin) request.getSession().getAttribute("admin");
		String adminCode = a.getAdmin_code();
		Admin admin = userMapper.findAdmin(adminCode);
		model.addAttribute("admin",admin);
		List<Role> roles = admin.getRoles();
		model.addAttribute("roles",roles);
		return "user/user_info";
	}
	
	@RequestMapping("/updateUser.do")
	public String updateUser(Admin admin){
		Admin a = (Admin) request.getSession().getAttribute("admin");
		admin.setAdmin_id(a.getAdmin_id());
		userMapper.update(admin);
		return "main/index";
	}
	
	
}
