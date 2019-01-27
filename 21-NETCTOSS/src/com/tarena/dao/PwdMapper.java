package com.tarena.dao;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Admin;

@MyBatisRepository
public interface PwdMapper {  

	 void update(Admin admin);
	
}
