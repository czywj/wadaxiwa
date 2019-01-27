package com.tarena.test;

import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.ServiceMapper;
import com.tarena.entity.page.ServicePage;

public class TestServiceMapper {

	@Test
	public void testFindByPage(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		ServiceMapper mapper = ctx.getBean(ServiceMapper.class);
		ServicePage page = new ServicePage();
		List<Map<String,Object>> list = mapper.findByPage(page);
		for(Map<String,Object> m : list){
			System.out.println(
					m.get("SERVICE_ID")+" "+
					m.get("OS_USERNAME")+" "+
					m.get("UNIX_HOST")+" "+
					m.get("NAME")
			);
		}
		int rows = mapper.findRows(page);
		System.out.println(rows);
	}
	
}
