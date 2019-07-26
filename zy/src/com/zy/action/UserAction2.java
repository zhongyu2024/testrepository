package com.zy.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Emp;
import com.zy.service.UserService;

@Controller

@RequestMapping("/index")
public class UserAction2 {
	@Resource
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping("")
	public String login(Emp emp,Model model,HttpSession session)throws Exception
	{
		Emp e = userService.getUserByName(emp.getUsername());
		if(e!=null)
		{
			if(e.getPowerid()==1||e.getPowerid()==2){
/*				System.out.println(e.getUserpass());
				System.out.println(emp.getUserpass());
*/				if(emp.getUserpass().equals("")&&e.getUserpass()==null){
					session.setAttribute("loginUser", e);
					return "redirect:/pages/zzy/index.jsp";
				}
				else{
					if(e.getUserpass().equals(emp.getUserpass()))
					{
						session.setAttribute("loginUser", e);
						return "redirect:/pages/zzy/index.jsp";
					}else{
						model.addAttribute("error2", "�����������");
					}
				}
			}
			else{
				model.addAttribute("error1","��ǰ�û���ʹ��Ȩ��");
			}
		}else{
			model.addAttribute("error1", "�û�������");
		}
		
		return "/pages/ck/login.jsp";
	}

	@RequestMapping("/reserve")
	public String reserve(Model model,HttpSession session) throws Exception{
			SimpleDateFormat format=new SimpleDateFormat("MM-dd");
			SimpleDateFormat format1=new SimpleDateFormat("HH:mm");
			Date today=new Date();
			Date tomorrow=new Date(today.getTime()+1000*60*60*24);
			Date houtian=new Date(today.getTime()+2*1000*60*60*24);
			String todayTime=format.format(today);
			String tr_today=todayTime.replace("-", "");
			String tomorrowTime=format.format(tomorrow);
			String houtianTime=format.format(houtian);
			String h=format1.format(new Date());
			String d1=format.format(new Date(today.getTime()+3*1000*60*60*24));
			String d2=format.format(new Date(today.getTime()+4*1000*60*60*24));
			String d3=format.format(new Date(today.getTime()+5*1000*60*60*24));
			String d4=format.format(new Date(today.getTime()+6*1000*60*60*24));
			session.setAttribute("today", todayTime);
			session.setAttribute("tr_today", tr_today);
			session.setAttribute("tomorrow", tomorrowTime);
			session.setAttribute("houtian", houtianTime);
			session.setAttribute("d1", d1);
			session.setAttribute("d2", d2);
			session.setAttribute("d3", d3);
			session.setAttribute("d4", d4);
			session.setAttribute("h",h);
			return "/foodtable/searchAll.do";
	}
	@RequestMapping("loginout")
	public String loginout(HttpSession session)throws Exception
	{
		
		session.removeAttribute("loginUser"); 
		return "/pages/ck/login.jsp";
		
	}
}
