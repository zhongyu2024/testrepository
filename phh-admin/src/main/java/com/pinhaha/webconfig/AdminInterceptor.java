package com.pinhaha.webconfig;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pinhaha.mapper.AdminSendSmsMapper;
import com.pinhaha.pojo.AdminSendSms;
import com.pinhaha.util.CookieUtil;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class AdminInterceptor implements HandlerInterceptor {

	@Value("${contexturl}")
	private String contexturl;
	
	@Value("${cookie_domain}")
	private String cookie_domain;
	
	@Autowired
	private AdminSendSmsMapper adminSendSmsMapper;
	
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
	public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o)
			throws Exception {
		log.info("---------------------开始进入请求地址拦截----------------------------");
		String s = (String) CookieUtil.getCookieValue(httpServletRequest, "admin");
		
		if (s != null && (s.equals("1") || s.equals("2") || s.equals("3") || s.equals("4") || s.equals("5")
				|| s.equals("6"))) {
			String urlPath=httpServletRequest.getServletPath();
			if(urlPath.equals("/xuexima/list") || urlPath.equals("/getmoney")
					|| urlPath.equals("/daili/list-province") || urlPath.equals("/daili/list-city")
					|| urlPath.equals("/daili/list-shareholder") || urlPath.equals("/daili/add_lev1")
					|| urlPath.equals("/daili/chaifen_lev")  || urlPath.equals("/soldier/list") 
					|| urlPath.equals("/daili/fieldClassVip") ){
				
				String tokenCheck = (String) CookieUtil.getCookieValue(httpServletRequest, "admin_check");
				CookieUtil.createCookieSevenDays(httpServletRequest, httpServletResponse, "refund_url", urlPath, cookie_domain);
				
				AdminSendSms smd=adminSendSmsMapper.getTheNewCode();
				
				if(tokenCheck == null || (tokenCheck!=null && !tokenCheck.equals(smd.getCode()))){
					httpServletResponse.sendRedirect("/checkAdmin"); 
					return false;
				}
				
			}
			
			return true;
		} else {
			httpServletResponse.sendRedirect("/login");
		}
		return false;

	}

	@Override
	public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o,
			ModelAndView modelAndView) throws Exception {
		log.info("--------------处理请求完成后视图渲染之前的处理操作---------------");
	}

	@Override
	public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse,
			Object o, Exception e) throws Exception {
		log.info("---------------视图渲染之后的操作-------------------------");
	}

}
