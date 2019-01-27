package com.tarena.entity;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable{

	private static final long serialVersionUID = 6975771400130531940L;

	private Integer role_id;
	private String name;
	
	/**
	 * 关联属性，用来封装当前角色对应的一组模块，
	 * 该组数据由MyBatis关联映射自动装配
	 */
	private List<Module> modules;
	
	/**
	 * 新增/修改保存时，用来封装页面传入的一组ID值。
	 */
	private List<Integer> moduleIds;
	
	

	public List<Integer> getModuleIds() {
		return moduleIds;
	}

	public void setModuleIds(List<Integer> moduleIds) {
		this.moduleIds = moduleIds;
	}

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer roleId) {
		role_id = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Module> getModules() {
		return modules;
	}

	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	@Override
	public String toString() {
		return "Role [moduleIds=" + moduleIds + ", modules=" + modules
				+ ", name=" + name + ", role_id=" + role_id + "]";
	}
	
	
}
