package com.tarena.dao;

import java.util.List;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Cost;
import com.tarena.entity.page.CostPage;

@MyBatisRepository
public interface CostMapper {

	List<Cost> findAll();
	
	void save(Cost cost);
	
	Cost findById(int id);
	
	void update(Cost cost);
	
	void delete(int id);
	
	/**
	 * 分页查询资费数据
	 * @param page
	 * @return
	 */
	List<Cost> findByPage(CostPage page);
	
	int findRows();
	
	void start(int id);
	
}
