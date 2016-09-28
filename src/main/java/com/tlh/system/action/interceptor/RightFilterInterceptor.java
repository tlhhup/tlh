package com.tlh.system.action.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tlh.util.ValidateUtil;

public class RightFilterInterceptor implements HandlerInterceptor {
	
	private static List<String> commons;
	
	static{
		commons=new ArrayList<String>();
		commons.add("web/loginAction/login.do");
		commons.add("web/loginAction/logout.do");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri=request.getRequestURI();
		uri=uri.substring(request.getContextPath().length()+1);
		if(commons.contains(uri)){
			return true;
		}else{
			//2、判断用户是否登录及判断该用户是否具有该权限
			if(ValidateUtil.hasRight(uri, request)){
				return true;
			}else{
				// TODO 点击页面上的按钮：没有权限时不跳转到登录界面
				response.sendRedirect(request.getContextPath()+"/login.jsp");
				return false;
			}
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
