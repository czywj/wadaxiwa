package com.tarena.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 *	判断当前访问的是哪一个模块，将结果module_id
 *	存入session。
 */
public class CurrentModuleInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@Override
	public boolean preHandle(
			HttpServletRequest request, 
			HttpServletResponse response,
			Object arg2) throws Exception {
		//获取本次请求url
		String url = request.getRequestURL().toString();
		//判断当前是哪一个模块
		int currentModule = 0; //默认为系统首页
		if(url.contains("role")) {
			currentModule = 1;
		} else if (url.contains("admin")) {
			currentModule = 2;
		} else if (url.contains("cost")) {
			currentModule = 3;
		} else if (url.contains("account")) {
			currentModule = 4;
		} else if (url.contains("service")) {
			currentModule = 5;
		} else if (url.contains("user")) {
			currentModule = 8;
		} else if (url.contains("pwd")) {
			currentModule = 9;
		} 
		//将判断结果，当前模块id存入session
		request.getSession().setAttribute("currentModule", currentModule);
		return true;
	}

}
