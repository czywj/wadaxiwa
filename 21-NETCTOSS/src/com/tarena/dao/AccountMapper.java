package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Account;
import com.tarena.entity.page.AccountPage;

@MyBatisRepository
public interface AccountMapper {

	List<Account> findByPage(AccountPage page);
	
	int findRows(AccountPage page);
	
	/**
	 * 暂停一条帐务帐号
	 */
	void pause(int id);
	
	void start(int id);
	
	void delete(int id);
	
	void insert(Account account);
	
	Account findByAccountId(int id);
	
	void update(Account account);
	
	Account findByIdcardNo(String id);
	
	
}
