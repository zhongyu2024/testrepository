package com.zy.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.VTJSearch;
import com.zy.bean.VTJtable;
import com.zy.bean.vipShuChu;
import com.zy.bean.vipShuRu;
import com.zy.service.VtjService;

@Controller
@RequestMapping("/Vtj")
public class VTongjiAction {
	@Resource
	private VtjService vvs;

	public void setVs(VtjService vvs) {
		this.vvs = vvs;
	}
	
	@RequestMapping("/ajaxSearch")
	public String ajaxSearch(Model model,String time1,String time2,String vname,String vctype,String co)throws Exception{
		System.out.println(time1+"--"+time2+"--"+vname+"--"+vctype+"--"+co);
		VTJSearch vs=new VTJSearch(time1, time2, vname, vctype);
		List<VTJtable> cc=new ArrayList<VTJtable>();
		if(time1.length()==0&&vname.length()==0&&vctype.equals("0")&&co.equals("off")){
			System.out.println("search1");
			cc=vvs.search1(vs);
		}
		if(time1.length()!=0&&vname.length()==0&&vctype.equals("0")&&co.equals("off")){
			System.out.println("search2");
			cc=vvs.search2(vs);
		}
		if(time1.length()==0&&vname.length()!=0&&vctype.equals("0")&&co.equals("off")){
			System.out.println("search3");
			cc=vvs.search3(vs);
		}
		if(time1.length()==0&&vname.length()==0&&!(vctype.equals("0"))&&co.equals("off")){
			System.out.println("search4");
			cc=vvs.search4(vs);
		}
		if(time1.length()==0&&vname.length()==0&&vctype.equals("0")&&co.equals("on")){
			System.out.println("search5");
			cc=vvs.search5(vs);
		}
		if(time1.length()!=0&&vname.length()!=0&&vctype.equals("0")&&co.equals("off")){
			System.out.println("search6");
			cc=vvs.search6(vs);
		}
		if(time1.length()!=0&&vname.length()==0&&!(vctype.equals("0"))&&co.equals("off")){
			System.out.println("search7");
			cc=vvs.search7(vs);
		}
		if(time1.length()!=0&&vname.length()==0&&vctype.equals("0")&&co.equals("on")){
			System.out.println("search8");
			cc=vvs.search8(vs);
		}
		if(time1.length()==0&&vname.length()!=0&&!(vctype.equals("0"))&&co.equals("off")){
			System.out.println("search9");
			cc=vvs.search9(vs);
		}
		if(time1.length()==0&&vname.length()!=0&&vctype.equals("0")&&co.equals("on")){
			System.out.println("search10");
			cc=vvs.search10(vs);
		}
		if(time1.length()==0&&vname.length()==0&&!(vctype.equals("0"))&&co.equals("on")){
			System.out.println("search11");
			cc=vvs.search11(vs);
		}
		if(time1.length()!=0&&vname.length()!=0&&!(vctype.equals("0"))&&co.equals("off")){
			System.out.println("search12");
			cc=vvs.search12(vs);
		}
		if(time1.length()!=0&&vname.length()!=0&&vctype.equals("0")&&co.equals("on")){
			System.out.println("search13");
			cc=vvs.search13(vs);
		}
		if(time1.length()!=0&&vname.length()==0&&!(vctype.equals("0"))&&co.equals("on")){
			System.out.println("search14");
			cc=vvs.search14(vs);
		}
		if(time1.length()==0&&vname.length()!=0&&!(vctype.equals("0"))&&co.equals("on")){
			System.out.println("search15");
			cc=vvs.search15(vs);
		}
		if(time1.length()!=0&&vname.length()!=0&&!(vctype.equals("0"))&&co.equals("on")){
			System.out.println("search16");
			cc=vvs.search16(vs);
		}
		model.addAttribute("cc", cc);
		return "/pages/lxd/ajaxTJ.jsp";
	}
	
	@RequestMapping("/ajaxSearch2")
	public String ajaxSearch2(Model model,String levelname,String doname,String time1,String time2,int xiaofei)throws Exception{
		vipShuRu sr=new vipShuRu(levelname, doname, time1, time2, xiaofei);
		System.out.println(levelname+"--"+doname+"--"+time1+"--"+time2+"--"+xiaofei);
		List<vipShuChu> cll=vvs.findByvip(sr);
		System.out.println("^^^^^^"+cll.size());
		model.addAttribute("cll", cll);
		return "/pages/lxd/ajaxMX.jsp";
	}
	
}
