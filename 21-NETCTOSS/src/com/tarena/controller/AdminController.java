package com.tarena.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.AdminMapper;
import com.tarena.dao.RoleMapper;
import com.tarena.entity.Admin;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.AdminPage;
import com.tarena.entity.page.RolePage;

@Controller
@RequestMapping("/admin")
@SessionAttributes("adminPage")
public class AdminController extends BaseController{

	@Resource
	private AdminMapper adminMapper;
	
	@Resource
	private RoleMapper roleMapper;
	
	public static final String DEFAULT_PASSWORD = "000";
	
	@RequestMapping("/findAdmin.do")
	public String find(AdminPage page, Model model) {
		//查询当前页的管理员
		List<Admin> list = 
			adminMapper.findByPage(page);
		model.addAttribute("admins", list);
		//查询总行数，计算总页数
		int rows = adminMapper.findRows(page);
		page.setRows(rows);
		model.addAttribute("adminPage", page);
		//查询全部的模块，用来创建下拉选
		List<Module> modules = roleMapper.findAllModule();
		model.addAttribute("modules", modules);
		return "admin/admin_list";
	}
	
	@RequestMapping("/resetPassword.do")
	public Map<String,Object> updatePassword(String ids){
		//将页面传入的id字符串，切割并装换成id的集合
		String[] idArray = ids.split(",");
		List<Integer> idList = new ArrayList<Integer>();
		for(String id : idArray){
			idList.add(Integer.valueOf(id));
		}
		//构造参数
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("adminIds", idList);
		param.put("defaultPassword", DEFAULT_PASSWORD);
		
		adminMapper.updatePassword(param);
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("success", true);
		result.put("message", "密码重置成功");
		return result;
	}
	
	@RequestMapping("/toAddAdmin.do")
	public String toAdd(Model model) {
		RolePage page = new RolePage();
		page.setPageSize(100000);
		List<Role> roles = roleMapper.findByPage(page);
		model.addAttribute("roles", roles);
		return "admin/add_admin";
	}
	
	@RequestMapping("/addAdmin.do")
	public String add(Admin admin){
		admin.setEnrolldate(new Timestamp(System.currentTimeMillis()));
		adminMapper.save(admin);
		List<Integer> roleIds = admin.getRoleIds();
		if(roleIds != null &&roleIds.size()>0){
			for(Integer roleId : roleIds){
				Map<String,Object> param = new HashMap<String,Object>();
				param.put("admin_id", admin.getAdmin_id());
				param.put("role_id",roleId);
				adminMapper.saveAdminRole(param);
			}
		}
		return "redirect:findAdmin.do";
	}
	
	@RequestMapping("/deleteAdmin.do")
	public String delete(int id){
		adminMapper.delete(id);
		adminMapper.deleteAdminRole(id);
		return "redirect:findAdmin.do";
	}
	
	@RequestMapping("/toUpdateAdmin.do")
	public String toUpdate(int id,Model model){
		//RolePage page = new RolePage();
		//List<Role> list = roleMapper.findByPage(page);
		List<Role> list = roleMapper.findAll();
		model.addAttribute("roles",list);
		Admin admin = adminMapper.findById(id);
		model.addAttribute("admin",admin);
		return "admin/update_admin";
	}
	
	@RequestMapping("/updateAdmin.do")
	public String update(Admin admin,Model model){
		System.out.println(admin.toString());
		adminMapper.update(admin);
		adminMapper.deleteAdminRole(admin.getAdmin_id());
		List<Integer> roleIds = admin.getRoleIds();
		for(Integer roleId : roleIds){
			Map<String,Object> adminRoles = new HashMap<String, Object>();
			adminRoles.put("admin_id", admin.getAdmin_id());
			adminRoles.put("role_id", roleId);
			adminMapper.saveAdminRole(adminRoles);
		}
		return "redirect:findAdmin.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
