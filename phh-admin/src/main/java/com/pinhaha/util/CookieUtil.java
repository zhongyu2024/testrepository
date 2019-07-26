package com.pinhaha.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * cookie 基本操作
 * <hr/>
 * 
 * @author 15257129351@163.com(SQL)
 * 
 * 
 * 
 */
public class CookieUtil {

	private final static Integer COOKIETIME = -1;//会话级cookie，关闭浏览器失效

	public synchronized static void createCookieWx(HttpServletRequest request, HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		boolean fals = false;
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			for (Cookie cookieTow : cookie) {
				if (cookieTow.getName().equals(titleName)) {
					cookieTow.setPath("/");
					cookieTow.setDomain("."+wwwUrl);
					cookieTow.setMaxAge(5 * 365 * 24 * 60 * 60); // 5年
					cookieTow.setValue(value.toString());
					response.addCookie(cookieTow);
					fals = true;
				}
			}
		}
		if (fals == false) {
			Cookie cookies = new Cookie(titleName, value.toString());
			cookies.setPath("/");
			cookies.setDomain("."+wwwUrl);
			cookies.setMaxAge(5 * 365 * 24 * 60 * 60); // 5年
			response.addCookie(cookies);
		}
	}

	public static void createCookie(HttpServletRequest request, HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(5 * 365 * 24 * 60 * 60);
		cookie.setPath("/");
       /* if(wwwUrl.split(":").length==2){
        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
        }
	    if(wwwUrl.contains("localhost")){
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }else{
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }*/
		response.addCookie(cookie);
	}
	
	public static void createCookieSevenDays(HttpServletRequest request, HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(7 * 24 * 60 * 60);
		cookie.setPath("/");
       /* if(wwwUrl.split(":").length==2){
        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
        }
	    if(wwwUrl.contains("localhost")){
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }else{
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }*/
		response.addCookie(cookie);
	}
	
	public static void createCookieData(HttpServletRequest request, HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(60 * 24 * 60 * 60);
		cookie.setPath("/");
        if(wwwUrl.split(":").length==2){
        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
        }
	    if(wwwUrl.contains("localhost")){
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }else{
	    	cookie.setDomain("."+wwwUrl.replace("/", ""));
	    }
		response.addCookie(cookie);
	}
	
	public static  void createCookieUser(HttpServletRequest request, HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(COOKIETIME);
		cookie.setPath("/");
        if(wwwUrl.split(":").length==2){
        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
        }
	    if(wwwUrl.contains("localhost")){
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }else{
	    	cookie.setDomain("."+wwwUrl.replace("/", ""));
	    }
		response.addCookie(cookie);
	}
	
	
	
	public static void deleteCookieAuto(HttpServletResponse response, String titleName){
		Cookie deleteNewCookie=new Cookie(titleName,null);
		deleteNewCookie.setMaxAge(0); //删除该Cookie
		deleteNewCookie.setPath("/");
		response.addCookie(deleteNewCookie);
	}
	public static void createCookieAuto(HttpServletResponse response, String titleName, Object value,String wwwUrl) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(60*60*24);
		cookie.setPath("/");
		wwwUrl = wwwUrl.replace("http://", "");
        if(wwwUrl.split(":").length==2){
        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
        }
	    if(wwwUrl.contains("localhost")){
	    	cookie.setDomain(wwwUrl.replace("/", ""));
	    }else{
	    	cookie.setDomain("."+wwwUrl.replace("/", ""));
	    }
		response.addCookie(cookie);
	}

	public static void createCookie(HttpServletRequest request, HttpServletResponse response, String titleName, Object value, Integer DateSize) {
		Cookie cookie = new Cookie(titleName, value.toString());
		cookie.setMaxAge(DateSize);
		cookie.setPath("/");
		response.addCookie(cookie);
		request.getSession().setAttribute("qtuser", value);
	}

	public static Cookie getCookie(HttpServletRequest request, HttpServletResponse response, String title) {
		Cookie[] cookie = request.getCookies();
		for (Cookie cookieTow : cookie) {
			if (cookieTow.getName().equals(title)) {
				return cookieTow;
			}
		}
		return null;
	}
	
	public static Object getCookieValue(HttpServletRequest request, HttpServletResponse response, String title) {
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			for (Cookie cookieTow : cookie) {
				if (cookieTow.getName().equals(title)) {
					if (cookieTow.getMaxAge() == 0) {
						return null;
					}
					return cookieTow.getValue();
				}
			}
		}
		return null;
	}
	
	public static Object getCookieValue(HttpServletRequest request, String title) {
		Cookie[] cookie = request.getCookies();
		if (cookie != null) {
			for (Cookie cookieTow : cookie) {
				if (cookieTow.getName().equals(title)) {
					if (cookieTow.getMaxAge() == 0) {
						return null;
					}
					return cookieTow.getValue();
				}
			}
		}
		return null;
	}

	public static void YiChucookieValue(HttpServletRequest request, HttpServletResponse response, String title,String wwwUrl) {
		Cookie[] cookie = request.getCookies();
		for (Cookie cookieTow : cookie) {
			if (cookieTow.getName().equals(title)) {
				cookieTow.setMaxAge(0);
				cookieTow.setPath("/");
		        if(wwwUrl.split(":").length==2){
		        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
		        }
			    if(wwwUrl.contains("localhost")){
			    	cookieTow.setDomain(wwwUrl.replace("/", ""));
			    }else{
			    	cookieTow.setDomain("."+wwwUrl.replace("/", ""));
			    }
			    response.addCookie(cookieTow);
			}
		}
	}
	
	public static void updateCookie(HttpServletRequest request,HttpServletResponse response,String title,String wwwUrl){
		Cookie[] cookie = request.getCookies();
		for (Cookie cookieTow : cookie) {
			if (cookieTow.getName().equals(title)) {
				cookieTow.setMaxAge(COOKIETIME);
				cookieTow.setValue(null);
				 if(wwwUrl.split(":").length==2){
			        	wwwUrl = wwwUrl.substring(0,wwwUrl.lastIndexOf(":"));
			      }
				 if(wwwUrl.contains("localhost")){
					 cookieTow.setDomain(wwwUrl.replace("/", ""));
				    }else{
				    	cookieTow.setDomain("."+wwwUrl.replace("/", ""));
				    }
				response.addCookie(cookieTow);
			}
		}
	}
}
