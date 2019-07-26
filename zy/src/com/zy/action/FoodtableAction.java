package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Foodtable;
import com.zy.bean.YudingFoodtable;
import com.zy.service.FoodtableService;

@Controller
@RequestMapping("/foodtable")
public class FoodtableAction {
	@Resource
	private FoodtableService foodtableService;
	public void setFoodtableService(FoodtableService foodtableService){
		this.foodtableService=foodtableService;
	}
	@RequestMapping("/searchAll")
	public String searchAll(HttpSession session)throws Exception{
		List<YudingFoodtable> flist=foodtableService.getFoodtable();		
		session.setAttribute("flist", flist);
		return "/pages/ck/reserve.jsp";
	}
	@RequestMapping("/searchFewSeat")
	public String searchTwo(HttpSession session,HttpServletRequest request, HttpServletResponse response)throws Exception{
		int size = Integer.parseInt(request.getParameter("size"));
		List<YudingFoodtable> flist1=foodtableService.getSeatBySize(size);
		session.setAttribute("flist1", flist1);
		return "/pages/ck/twotable.jsp";
	}
	@RequestMapping("/searchMoreSeat")
	public String searchMore(HttpSession session,HttpServletRequest request, HttpServletResponse response)throws Exception{
		List<YudingFoodtable> flist1=foodtableService.getMoreSeat();
		session.setAttribute("flist1", flist1);
		return "/pages/ck/twotable.jsp";
	}
}
