package com.tarena.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.tarena.dao.AdminMapper;
import com.tarena.dao.RoleMapper;
import com.tarena.entity.Admin;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.AdminPage;
import com.tarena.entity.page.RolePage;

@Controller
@RequestMapping("/role")
@SessionAttributes("rolePage")
public class RoleController extends BaseController{

	@Resource
	private RoleMapper roleMapper;
	
	@Resource
	private AdminMapper adminMapper;
	
	@RequestMapping("/findRole.do")
	public String find(RolePage page,Model model){
		//查询出当前页的角色
		List<Role> list = roleMapper.findByPage(page);
		model.addAttribute("roles",list);
		//查询总行数，计算出总页数
		int rows = roleMapper.findRows();
		page.setRows(rows);
		model.addAttribute("rolePage",page);
		return "role/role_list";
	}
	
	@RequestMapping("/toAddRole.do")
	public String toAdd(Model model){
		//查询全部的模块，用来创建checkbox
		List<Module> list = roleMapper.findAllModule();
		model.addAttribute("modules",list);
		return "role/add_role";
	}
	
	@RequestMapping("/addRole.do")
	public String add(Role role){
		//新增角色
		roleMapper.save(role);
		//新增角色模块中间表
		List<Integer> moduleIds = role.getModuleIds();
		if(moduleIds != null && moduleIds.size()>0){
			//遍历模块ID
			for(Integer moduleId : moduleIds){
				//插入一组中间表数据
				Map<String,Object> param = new HashMap<String,Object>();
				param.put("role_id", role.getRole_id());
				param.put("module_id",moduleId);
				roleMapper.saveRoleModule(param);
			}
		}
		return "redirect:findRole.do";
	}
	
	@RequestMapping("/checkRoleName.do")
	@ResponseBody
	public boolean checkRoleName(String name){
		//休眠5秒，模拟网络延时
		try {
			Thread.sleep(5000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		Role role = roleMapper.findByName(name);
		if(role == null){
			//没有重名，校验通过
			return true;
		}else{
			return false;
		}
	}
	
	@RequestMapping("/toUpdateRole.do")
	public String toUpdate(int id,Model model){
		//查询全部的模块，用来创建checkbox
		List<Module> list = roleMapper.findAllModule();
		model.addAttribute("modules",list);
		//查询要修改的角色
		Role role = roleMapper.findById(id);
		model.addAttribute("role",role);
		return "role/update_role";
	}
	
	@RequestMapping("/updateRole.do")
	public String update(Role role){
		//修改角色
		roleMapper.update(role);
		//根据角色ID删除中间表数据
		roleMapper.deleteRoleModule(role.getRole_id());
		//重新插入中间表数据
		List<Integer> moduleIds = role.getModuleIds();
		if(moduleIds != null && moduleIds.size()>0){
			//遍历模块ID
			for(Integer moduleId : moduleIds){
				//插入一组中间表数据
				Map<String,Object> param = new HashMap<String,Object>();
				param.put("role_id", role.getRole_id());
				param.put("module_id",moduleId);
				roleMapper.saveRoleModule(param);
			}
		}
		return "redirect:findRole.do";
	}
	
	@RequestMapping("/deleteRole.do")
	public String delete(int id,HttpSession session){
		//从session中读取用户信息
		Admin admin = (Admin) session.getAttribute("admin");
		List<Integer> list = adminMapper.findRoleIdByAdmin(admin.getAdmin_id());
		int count = 0;
		for(int i = 0 ;i<list.size();i++){
			if(id == list.get(i)){
				count++;
			}
		}
		if(count != 1){
			roleMapper.delete(id);
			roleMapper.deleteRoleModule(id);
		}else{
			System.out.println("不能删除当前用户");
		}
		return "redirect:findRole.do";
	}
	
	
	
	
	
	
	
}
