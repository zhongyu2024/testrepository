package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Emp;
import com.zy.dao.mapper.MimayzMapper;

@Controller
@RequestMapping("/Mimayz")
public class MimayzAction {
	@Resource
	private MimayzMapper mm;
	public void setMm(MimayzMapper mm) {
		this.mm = mm;
	}
	@RequestMapping("/yzMima")
	public void yzMima(String userpass,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String str="";
		Emp emp=(Emp)request.getSession().getAttribute("loginUser");//拿到session
		String c=emp.getUsername();//拿到当前用户登录名
		String s=mm.huoquPass(c);//获取到当前用户密码
		System.out.println(s);
		System.out.println(userpass);
		if(s.equals(userpass)){
			str="111";//相同
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
	@RequestMapping("/changePass")
	public void changePass(String userpass,HttpServletRequest request,HttpServletResponse response) throws IOException{
		String str="";
		Emp emp=(Emp)request.getSession().getAttribute("loginUser");
		int s=emp.getId();
		System.out.println(s);
		if(mm.changePass(userpass,s)){
			str="111";//lose
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(str);
		out.flush();
		out.close();
	}
}
