package com.tarena.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.AdminMapper;
import com.tarena.entity.Admin;
import com.tarena.entity.Role;
import com.tarena.entity.page.AdminPage;

public class TestAdminMapper {

	@Test
	public void testUpdatePassword(){
		ApplicationContext ctx = 
			new ClassPathXmlApplicationContext(
					"applicationContext.xml");
		AdminMapper mapper = ctx.getBean(AdminMapper.class);
		Map<String,Object> param = new HashMap<String,Object>();
		List<Integer> ids = new ArrayList<Integer>();
		ids.add(6000);
		ids.add(7000);
		param.put("adminIds", ids);
		param.put("defaultPassword", "abc");
		mapper.updatePassword(param);
	}
	
	
	
	@Test
	public void testFindByPage() {
		ApplicationContext ctx = 
			new ClassPathXmlApplicationContext(
					"applicationContext.xml");
		AdminMapper mapper = 
			ctx.getBean(AdminMapper.class);
		AdminPage page = new AdminPage();
		page.setCurrentPage(2);
		List<Admin> list = mapper.findByPage(page);
		for(Admin a : list) {
			System.out.println(
				a.getAdmin_code() + " " + a.getName());
			List<Role> roles = a.getRoles();
			for(Role r : roles) {
				System.out.println(
					r.getRole_id() + " " + r.getName());
			}
			System.out.println("------------");
		}
	}
	
	
	
}
