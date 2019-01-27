package com.tarena.dao;


import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Admin;

@MyBatisRepository
public interface UserMapper {

	Admin findAdmin(String adminCode);
	
	void update(Admin admin);
	
}
