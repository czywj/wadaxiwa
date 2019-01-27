package com.tarena.entity.page;

import java.io.Serializable;

import org.springframework.stereotype.Component;

/**
 * 封装资费的分页条件
 * @author tarena
 *
 */
@Component
public class CostPage extends Page implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2381975079379414392L;
	
	private String baseDurationSort;

	private String baseCostSort;

	public String getBaseDurationSort() {
		return baseDurationSort;
	}

	public void setBaseDurationSort(String baseDurationSort) {
		this.baseDurationSort = baseDurationSort;
	}

	public String getBaseCostSort() {
		return baseCostSort;
	}

	public void setBaseCostSort(String baseCostSort) {
		this.baseCostSort = baseCostSort;
	}
	
	
}
