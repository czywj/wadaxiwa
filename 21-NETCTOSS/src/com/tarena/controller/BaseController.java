package com.tarena.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;

/**
 * 是Controller的父类，用于封装公共的业务逻辑
 * @author tarena
 *
 */
public class BaseController implements WebBindingInitializer{

	/**
	 * binder参数可以给指定的数据类型绑定类型转换器
	 * 我们可以利用它修改日期类型转换器
	 */
	@Override
	//@InitBinder注解是让该方法在请求开始时调用一次
	@InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		
		//给java.sql.Date类型绑定自定义转换器CustomDateEditor,
		//该转换器由Spring提供，也可以自己写。
		//该转换器有2个参数，第一个参数是SimpleDateFormat，用于指定日期格式
		//第二个参数是是否为空。
		String s=request.getParameter("birthdate");
		System.out.println(s);
		if(s==null||"".equals(s)){
			
		binder.registerCustomEditor(
				java.sql.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"),true));
	//binder.registerCustomEditor(
		//java.sql.Date.class, new DateEditor());
		}
	}

}
