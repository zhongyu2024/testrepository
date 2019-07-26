package com.zy.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Yuding;
import com.zy.bean.YudingFoodtable;
import com.zy.bean.YudingQuery;
import com.zy.service.YudingService;

@Controller
@RequestMapping("/yuding")
public class YudingAction {
	@Resource
	private YudingService yudingService;
	public void setYudingService(YudingService yudingService){
		this.yudingService=yudingService;
	}
	@RequestMapping("/time")
	public String findByTime(HttpSession session,String yutime,int opentimeid,String seatsize) throws Exception{
		YudingQuery yq=new YudingQuery(yutime,opentimeid,seatsize);
		List<YudingFoodtable> ylist=yudingService.findQuery(yq);
		int ydid=yudingService.findId()+1;
		session.setAttribute("ylist", ylist);
		session.setAttribute("ydid",ydid);
		return "/pages/ck/alltable.jsp";
	}
	
	
	/*ÐÂÔöÔ¤¶©¼ÇÂ¼*/
	@RequestMapping("/insertYuding")
	public String insertYuding(HttpServletRequest request) throws Exception{
		String name=request.getParameter("name");
		int sex=Integer.parseInt(request.getParameter("sex"));
		String tel=request.getParameter("tel");
		int mannum=Integer.parseInt(request.getParameter("mannum"));
		String yutime=request.getParameter("yutime");
		float baotime=Float.parseFloat(request.getParameter("baotime"));
		String info=request.getParameter("info");
		float money=Float.parseFloat(request.getParameter("money"));
		int opentimeid=Integer.parseInt(request.getParameter("opentimeid"));
		int tableid=Integer.parseInt(request.getParameter("tableid"));
		Yuding yuding=new Yuding(name,sex,tel,mannum,yutime,baotime,info,money,tableid,opentimeid);
		yudingService.addYuding(yuding);
		return "/pages/ck/reservelist.jsp";
	}
	@RequestMapping("/list")
	public String findByQuery(Model model,String yutime,int state,int pageno,int createtime,HttpSession session) throws Exception{
		YudingQuery yq=new YudingQuery(yutime,state,createtime,pageno);
		List<Yuding> ydlist=yudingService.findByQuery(yq);
		int pageNum=(yudingService.findNum())/14+1;
		session.setAttribute("pageNum", pageNum);
		session.setAttribute("ydlist", ydlist);
		return "/pages/ck/relist.jsp";
	}
	@RequestMapping("/inf")
	public String findInfo(HttpServletRequest request,HttpSession session) throws Exception{
		String info=request.getParameter("info");
		String st=request.getParameter("st");
		int pageno=Integer.parseInt(request.getParameter("pageno"));
		List<Yuding> ydlist=null;
		if(st.equals("name")){
			ydlist=yudingService.findByName(info,pageno);}
		else if(st.equals("tel")){
			ydlist=yudingService.findByTel(info,pageno);
		}
		int a=ydlist.size();
		session.setAttribute("ydlist", ydlist);
		session.setAttribute("a", a);
		return "/pages/ck/relist.jsp";
	}
	
	@RequestMapping("/update")
	public String updateYuding(HttpServletRequest request,HttpSession session)throws Exception{
		int state=Integer.parseInt(request.getParameter("state"));
		int id=Integer.parseInt(request.getParameter("id"));
		Yuding yd=new Yuding(state,id);
		yudingService.updateYuding(yd);
		return "/pages/ck/relist.jsp";
	}
}
