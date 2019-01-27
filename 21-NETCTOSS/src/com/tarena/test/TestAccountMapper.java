package com.tarena.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tarena.dao.AccountMapper;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

public class TestAccountMapper {

	ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
	
	@Test
	public void testFindByPage(){
		AccountMapper mapper = ctx.getBean(AccountMapper.class);
		AccountPage page = new AccountPage();
		page.setCurrentPage(3);
		List<Account> list = mapper.findByPage(page);
		for(Account a : list){
			System.out.println(
					a.getAccount_id()+" "+
					a.getIdcard_no()+" "+
					a.getReal_name()
			);
		}
		
	}
	
	
	
}
