package com.tarena.dao;

import java.util.List;
import java.util.Map;

import com.tarena.annotation.MyBatisRepository;
import com.tarena.entity.Admin;
import com.tarena.entity.Module;
import com.tarena.entity.Role;
import com.tarena.entity.page.AdminPage;

@MyBatisRepository
public interface AdminMapper {

	List<Admin> findByPage(AdminPage page);
	
	int findRows(AdminPage page);
	
	/**
	 * 修改密码
	 * Map中封装了2个参数
	 * key						value
	 * adminIds				List<Integer>
	 * defaultPassword		String
	 */
	
	void updatePassword(Map<String,Object> param);
	
	void save(Admin admin);
	
	void saveAdminRole(Map<String,Object> param);
	
	List<Module> findAllModule();
	
	void delete(int id);
	
	void deleteAdminRole(int adminId);
	
	Admin findById(int id);
	
	void update(Admin admin);
	
	/**
	 * 根据帐号查询管理员
	 */
	Admin findByCode(String adminCode);
	
	/**
	 * 查询指定的管理员对应的模块
	 */
	List<Module> findModuleByAdmin(Integer adminId);
	
	List<Integer> findRoleIdByAdmin(Integer adminId);
	
}
