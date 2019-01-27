package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Service;
import com.tarena.entity.page.ServicePage;

@MyBatisRepository
public interface ServiceMapper {

	List<Map<String,Object>> findByPage(ServicePage page);
	
	int findRows(ServicePage page);
	
	void deleteByAccount(int accountId);
	
	void pauseByAccount(int accountId);
	
	void save(Service service);
	
	void updateStatus(Service service);
	
	Service findById(int id);
	
	void update(Service service);
	
	
}
