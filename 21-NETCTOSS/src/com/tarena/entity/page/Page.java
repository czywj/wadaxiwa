package com.tarena.entity.page;

import java.io.Serializable;

/**
 * 所有分页组件的父类，用来封装公共的分页条件。
 * @author tarena
 *
 */
public class Page implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5115106553442105342L;

	
	//当前访问的页码，默认是第一页
	private int currentPage = 1;
	//每页显示最大行数，是固定值
	private int pageSize = 5;
	
	//需要在执行SQL语句前运算出begin和end，在执行SQL时利用这个运算结果。
	//由于#{}执行时调用属性的get方法取值，所以在get方法中运算
	private int begin;
	private int end;
	
	//总行数,需要外接传入
	private int rows;
	//总页数，在get方法中自动计算，方便复用
	private int totalPage;
	
	
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getTotalPage() {
		if(rows%pageSize==0){
			totalPage = rows/pageSize;
		}else{
			totalPage = rows/pageSize+1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getBegin() {
		begin = (currentPage-1)*pageSize;
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		end = currentPage*pageSize+1;
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
