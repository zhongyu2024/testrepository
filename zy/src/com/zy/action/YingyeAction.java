package com.zy.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Caipinfenxi;
import com.zy.bean.Cooktype;
import com.zy.bean.Listinfo;
import com.zy.bean.ZList;
import com.zy.dao.mapper.YingyeMapper;

@Controller
@RequestMapping("/YingyeAction")
public class YingyeAction {
	
	@Resource
	private YingyeMapper yym;
	public void setYym(YingyeMapper yym){
		this.yym = yym;
	}
	@RequestMapping("/showyemian")
	public String showyemian(Model model){
		
		List<Cooktype> ck=yym.getAll();
		model.addAttribute("ck", ck);
		return "/baobiao/tot.do";
	}
	
	@RequestMapping("/findPayDetail")
	public String findPayDetail(Model model,String txts3b2,String test17,String test18) throws Exception{
		if(test17.length()==0){
			test17=null;
		}
		if(test18.length()==0){
			test18=null;
		}
		if(txts3b2.length()==0){
			txts3b2=null;
		}
		List<ZList> zlt = yym.findPayDetail(txts3b2, test17, test18);
		model.addAttribute("a",zlt);
		return  "/pages/lxd/SelectB3S2.jsp";
	}
	
	@RequestMapping("/findByCaipin")
	public String findByCaipin(Model model,int s3b1Sel,String test11,String test12) throws Exception{
		if(test11.length()==0){
			test11=null;
		}
		if(test12.length()==0){
			test12=null;
		}
		List<Caipinfenxi> lif = yym.findByCaipin(s3b1Sel, test11,test12);
		
		model.addAttribute("s31",lif);	
		return "/pages/lxd/SelectB3S1.jsp";
	}
	
	@RequestMapping("/findTableDet")
	public String findTableDet(Model model,int s3b3Sel,String test19,String test20) throws Exception{
		if(test19.length()==0){
			test19=null;
		}
		if(test20.length()==0){
			test20=null;
		}
		List<ZList> zlt2 = yym.findTableDet(s3b3Sel, test19, test20);
		model.addAttribute("s33",zlt2);
		return "/pages/lxd/SelectB3S3.jsp";
	}
	
}
