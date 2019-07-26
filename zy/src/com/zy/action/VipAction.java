package com.zy.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.zy.bean.Vip;
import com.zy.bean.VipQuery;
import com.zy.bean.VipRecord;
import com.zy.bean.Vlevel;
import com.zy.service.VipRecordService;
import com.zy.service.VipService;
import com.zy.service.VlevelService;
@Controller
@RequestMapping("vips")
public class VipAction {
	@Resource
	private VipService vipService;
	public void setVipService(VipService vipService) {
		this.vipService = vipService;
	}
	@Resource
	private VipRecordService vipRecordService;
	public void setVipRecordService(VipRecordService vipRecordService) {
		this.vipRecordService = vipRecordService;
	}
	
	@Resource
	private VlevelService vlevelService;
	public void setVlevelService(VlevelService vlevelService) {
		this.vlevelService = vlevelService;
	}
/*	@RequestMapping("all")
	public String findAllVip(Model model){
		System.out.println("进入action findAllVip方法");
		List<Vip> avip = vipService.findAllVip();
		model.addAttribute("avip", avip);
		return "/pages/lw/vipinfo.jsp";
	}*/
	
	@RequestMapping("jiancha")
	public void findVip(int id,HttpServletResponse res) throws IOException{
		System.out.println("检查ID是否存在");
		System.out.println(id);
		Vip vip=vipService.findVip(id);
		int a=1;
		if(vip==null){
			a=0;
		}
		res.setContentType("html");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		out.print(a);
		out.flush();
		out.close();
	}
	@RequestMapping("pwd")
	public void findVipById(int id,HttpServletResponse res) throws IOException{
		System.out.println("查询密码");
		System.out.println(id);
		Vip vip=vipService.findVip(id);
		String pwd=vip.getPwd();
		res.setContentType("html");
		res.setCharacterEncoding("utf-8");
		PrintWriter out = res.getWriter();
		out.print(pwd);
		out.flush();
		out.close();
	}
	
	@RequestMapping("fv")
	public String findVips(VipQuery vq,Model model){
		System.out.println("进入动态查询方法");
		System.out.println(vq.getId()+"--"+vq.getMax()+"--"+vq.getMin()+"--"+vq.getState());
		
		List<Vip> avip = vipService.findVips(vq);
		for(Vip v:avip)
		{
			System.out.println("会员ID："+v.getId());
			v.setTypename(vipService.findlevelnameByid(v.getV_level()).getName());
			v.setCount(vipService.findlevelnameByid(v.getV_level()).getCount());
			System.out.println("长度："+vipService.findPayMoneyId(v.getId()).size());
			if(vipService.findPayMoneyId(v.getId()).size()!=0)
			{
				v.setAllpay(vipService.findPayMoney(v.getId()));
				System.out.println("总消费额："+vipService.findPayMoney(v.getId()));
			}
		}
		model.addAttribute("avip",avip);
		System.out.println(vq.getPageno());
		int pageno=vq.getPageno();
		model.addAttribute("pageno",pageno);
		return "/pages/lw/vipinfo.jsp";
	}
	
	@RequestMapping("adv")
	public String addVip(Vip vip,HttpSession session,HttpServletRequest request)throws Exception{
		System.out.println("进入addVip方法");
		request.setCharacterEncoding("UTF-8");
		int sex=Integer.parseInt(request.getParameter("sex"));
		int v_level=Integer.parseInt(request.getParameter("v_level"));
		String birthday=request.getParameter("birthday");
		String pwd=request.getParameter("pwd1");
		vip.setPwd(pwd);
		vip.setName(vip.getName());
		vip.setSex(sex);
		vip.setV_level(v_level);
		vip.setBirthday(birthday);
		System.out.println(birthday);
		System.out.println(vip.getName());
		System.out.println(pwd);
		vipService.addVip(vip);
		return "redirect:/pages/lw/vip.jsp";
	}
	
	@RequestMapping("byid")
	public String findById(int id,HttpServletRequest request){
		System.out.println("进入findById");
		System.out.println(id);
		Vip vip1=vipService.findById(id);
		if(vip1!=null){
			request.setAttribute("vip1", vip1);
			int levelid1=vip1.getV_level();
			Vlevel vlevel1=vlevelService.findLevelById(levelid1);
			request.setAttribute("vlevel1", vlevel1);
			
			if(vipService.findPayMoneyId(vip1.getId()).size()!=0)
			{
				vip1.setAllpay(vipService.findPayMoney(vip1.getId()));
				System.out.println("总消费额："+vipService.findPayMoney(vip1.getId()));
			}
			return "/pages/lw/showvip.jsp";
		}
		return "/pages/lw/notfound.jsp";
	}
	@RequestMapping("bytel")
	public String findByTel(String tel,HttpServletRequest request){
		System.out.println("进入findByTel");
		System.out.println(tel);
		Vip vip1=vipService.findByTel(tel);
		if(vip1!=null)
		{
			request.setAttribute("vip1", vip1);
			int levelid1=vip1.getV_level();
			Vlevel vlevel1=vlevelService.findLevelById(levelid1);
			request.setAttribute("vlevel1", vlevel1);
			if(vipService.findPayMoneyId(vip1.getId()).size()!=0)
			{
				vip1.setAllpay(vipService.findPayMoney(vip1.getId()));
				System.out.println("总消费额："+vipService.findPayMoney(vip1.getId()));
			}
			return "/pages/lw/showvip.jsp";
		}
		return "/pages/lw/notfound.jsp";
	}
	
	@RequestMapping("cz")
	public String chongzhi(VipRecord vr){
		System.out.println("进入chongzhi");
		System.out.println(vr.getVipid()+"--"+vr.getMoney());
		vipService.chongzhi(vr);
		return "byid.do?id="+vr.getVipid();
	}
	@RequestMapping("stop")
	public String stopVip(int id){
		System.out.println("进入stopVip");
		vipService.stopVip(id);
		return "byid.do?id="+id;
	}
	@RequestMapping("del")
	public String delVip(int id){
		System.out.println("进入delVip");
		vipService.delVip(id);
		return "byid.do?id="+id;
	}
	@RequestMapping("change")
	public String modiVip(Vip vip){
		System.out.println("进入modiVip");
		System.out.println("name:"+vip.getName());
		vipService.modiVip(vip);
		return "byid.do?id="+vip.getId();
	}
}
