package com.tarena.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.CostMapper;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;

public class TestCostMapper {

	@Test
	public void testFindAll() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		List<Cost> list = mapper.findAll();
		for(Cost c : list) {
			System.out.println(
				c.getCost_id() + " " +
				c.getName() + " " +
				c.getDescr()
			);
		}
	}
	
	@Test
	public void testSave(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		Cost c = new Cost();
		c.setName("tarena套餐");
		c.setBase_duration(90);
		c.setStatus("0");
		c.setCost_type("2");
		mapper.save(c);
	}
	
	@Test
	public void testFindById(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		Cost c = mapper.findById(1);
		System.out.println(c.getName()+" "+c.getDescr());
	}
	
	@Test
	public void testUpdate(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		Cost c = mapper.findById(160);
		c.setName("xxxx");
		c.setBase_duration(30);
		c.setBase_cost(3.0);
		c.setUnit_cost(0.3);
		mapper.update(c);
	}
	
	@Test
	public void testDelete(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		Cost c = mapper.findById(160);
		mapper.delete(c.getCost_id());
		
	}
	
	@Test
	public void testFindByPage(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		CostPage page = new CostPage();
		page.setCurrentPage(2);
		List<Cost> list = mapper.findByPage(page);
		for(Cost c : list){
			System.out.println(
				c.getCost_id()+ " " +
				c.getName()+ " " +
				c.getDescr());
		}
	}
	
	@Test
	public void testFindRows(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		CostMapper mapper = ctx.getBean(CostMapper.class);
		int rows = mapper.findRows();
		System.out.println(rows);
	}
	
	
	
	
	
	
	
	
	
}
