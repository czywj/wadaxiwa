package com.tarena.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.RoleMapper;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.RolePage;

public class TestRoleMapper {

	@Test
	public void testFindByPage(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleMapper mapper = ctx.getBean(RoleMapper.class);
		RolePage page = new RolePage();
		page.setCurrentPage(1);
		List<Role> list = mapper.findByPage(page);
		for(Role r : list){
			System.out.println(r.getRole_id()+" "+r.getName());
			List<Module> modules = r.getModules();
			for(Module m : modules){
				System.out.println(m.getModule_id()+" "+m.getName());
			}
			System.out.println("---------------------");
		}
		
	}
	
	@Test
	public void testSave(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleMapper mapper = ctx.getBean(RoleMapper.class);
		Role role = new Role();
		role.setName("比马文");
		mapper.save(role);
		
		//假设给当前角色选择的模块是3
		Map<String,Object> param = new HashMap<String,Object>();
		param.put("role_id", role.getRole_id());
		param.put("module_id", 3);
		mapper.saveRoleModule(param);
	}
	
	@Test
	public void testFindById(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		RoleMapper mapper = ctx.getBean(RoleMapper.class);
		Role role = mapper.findById(200);
		System.out.println(role.getName());
		List<Module> list = role.getModules();
		for(Module m : list){
			System.out.println(m.getModule_id()+" "+m.getName());
		}
	
	}
	
	
	
	
	
	
	
	
	
}
