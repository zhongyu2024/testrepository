package com.pinhaha.webconfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class FirstInterceptor implements HandlerInterceptor {

	/**
	 * 进入controller层之前拦截请求
	 * 
	 * @param httpServletRequest
	 * @param httpServletResponse
	 * @param o
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
		// 判断是否为ajax请求，默认不是
		if(httpServletRequest.getMethod().equals("OPTIONS")){
			httpServletResponse.setHeader("Access-Control-Allow-Origin", "*");
			httpServletResponse.setHeader("Access-Control-Allow-Methods", "POST,OPTIONS,GET");
			httpServletResponse.setHeader("Access-Control-Max-Age", "3600");
			httpServletResponse.setHeader("Access-Control-Allow-Headers", "accept,x-requested-with,Content-Type,Access-toke,Access-UseId");
			httpServletResponse.setHeader("Access-Control-Allow-Credentials", "true");
			return true;
		}
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
	}

	/*
	 * public String refreshToken(String refreshToken) throws Exception {
	 * 
	 * // log.info("getToken");
	 * 
	 * String Token = null; try { Token =
	 * GetAccessToken.refreshToken(refreshToken); } catch (Exception e) {
	 * e.printStackTrace(); } return Token; }
	 */
}
