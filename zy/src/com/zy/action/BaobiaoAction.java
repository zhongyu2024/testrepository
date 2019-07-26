package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Cooktype;
import com.zy.service.BaobiaoService;

@Controller
@RequestMapping("/baobiao")
public class BaobiaoAction {
@Resource
	private BaobiaoService baobiaoService;
	public void setBaobiaoService(BaobiaoService baobiaoService){
		this.baobiaoService=baobiaoService;
	}
	@RequestMapping("/tot")
	public String findTotal(HttpSession session/*,String beginTime,String endTime*/)throws Exception{
		String beginTime="2017-10-6 00:00:00";
		String endTime="2025-10-28 23:59:59";
		int total=baobiaoService.findTotal(beginTime, endTime);
		int sum=baobiaoService.findSum(beginTime, endTime);
		int hum=baobiaoService.findHum(beginTime, endTime);
		List<Cooktype> clist=baobiaoService.findCaiType(beginTime, endTime);
		int renjun=total/hum;
		int kedan=total/sum;
		String cooktypename1="�������";
		String cooktypename2="�����Ȳ�";
		String cooktypename3="��ɫС��";
		String cooktypename4="��������";
		String cooktypename5="��Ʒ����";
		String cooktypename6="��ˮ����";
		int a1;int a2;int a3;int a4;int a5;int a6;
		int chongzhi=baobiaoService.findSumMoney(beginTime, endTime);
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename1).size()==0){
			a1=0;
		}
		else{
			a1=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename1);
		}
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename2).size()==0){
			a2=0;
		}
		else{
			a2=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename2);
		}
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename3).size()==0){
			a3=0;
		}
		else{
			a3=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename3);
		}
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename4).size()==0){
			a4=0;
		}
		else{
			a4=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename4);
		}
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename5).size()==0){
			a5=0;
		}
		else{
			a5=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename5);
		}
		if(baobiaoService.findCaiMoneyId(beginTime, endTime, cooktypename6).size()==0){
			a6=0;
		}
		else{
			a6=baobiaoService.findCaiMoney(beginTime, endTime, cooktypename6);
		}
		session.setAttribute("total", total);
		session.setAttribute("sum", sum);
		session.setAttribute("hum", hum);
		session.setAttribute("renjun", renjun);
		session.setAttribute("kedan", kedan);
		session.setAttribute("chongzhi", chongzhi);
		session.setAttribute("a1", a1);
		session.setAttribute("a2", a2);
		session.setAttribute("a3", a3);
		session.setAttribute("a4", a4);
		session.setAttribute("a5", a5);
		session.setAttribute("a6", a6);
		session.setAttribute("clist", clist);
		return "/pages/lxd/yybb.jsp";
	}
}
