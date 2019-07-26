package com.zy.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONArray;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.zy.bean.VipRecord;
import com.zy.service.VipRecordService;
@Controller
@RequestMapping("vipre")
public class VipRecordAction {
	@Resource
	private VipRecordService vipRecordSevice;
	public void setVipRecordSevice(VipRecordService vipRecordSevice) {
		this.vipRecordSevice = vipRecordSevice;
	}
	@RequestMapping("fr")
	public void findRecordById(HttpServletResponse res,HttpServletRequest req) throws Exception{
		System.out.println("进入findRecordById");
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		
		List<VipRecord> vrecords=vipRecordSevice.findRecordById(id);
		JSONArray js=new JSONArray().fromObject(vrecords);
		res.setContentType("text/json");
		res.setCharacterEncoding("utf-8");
		PrintWriter out=res.getWriter();
		out.print(js);
		out.flush();
		out.close();
	}
	@RequestMapping("fr1")
	public void findPayRecordById(HttpServletRequest req,HttpServletResponse res) throws IOException{
		System.out.println("进入findPayRecordById");
		int id=Integer.parseInt(req.getParameter("id"));
		System.out.println(id);
		List<VipRecord> vrecords=vipRecordSevice.findPayRecordById(id);
		JSONArray js=new JSONArray().fromObject(vrecords);
		res.setContentType("text/json");
		res.setCharacterEncoding("utf-8");
		PrintWriter out=res.getWriter();
		out.print(js);
		out.flush();
		out.close();
	}
	
}
