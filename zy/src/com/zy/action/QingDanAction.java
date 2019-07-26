package com.zy.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.Hetable;
import com.zy.bean.Listinfo;
import com.zy.bean.Opentime;
import com.zy.bean.PageBean;
import com.zy.bean.QueryQingDanFenye;
import com.zy.bean.ZList;
import com.zy.service.QingDanService;

@Controller
@RequestMapping("/qingdan")
public class QingDanAction {
	@Resource
	private QingDanService qdService;

	public void setQdService(QingDanService qdService) {
		this.qdService = qdService;
	}
	@RequestMapping("/findAllQingDan")
	public String findAllQingDan(Model model,int pageNum ,int t)throws Exception
	{
		List<Opentime> allopentime=qdService.findAllOpentime();
		model.addAttribute("allopentime", allopentime);
		List<ZList> zls=qdService.findAllQingDan();
		
		System.out.println(zls.size());
		int pagesize=11;
 		int totalRecord=zls.size();//�ܼ�¼
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize);
 		List<ZList> pblist=qdService.findAlllistFenye(start, end);
		for(ZList zl:pblist)
		{
			if(zl.getType()==0)
			{
				zl.setTypename("��ʳ");
			}else if(zl.getType()==1)
			{
				zl.setTypename("���");
			}else if(zl.getType()==2)
			{
				zl.setTypename("����");
			}
			/*0-�µ���1-�ѽ��ˣ�2-ȡ����3-�ⵥ��4-δ�µ�*/			
			if(zl.getState()==0)
			{
				zl.setStatename("�µ�");
			}else if(zl.getState()==1)
			{
				zl.setStatename("�ѽ���");
			}else if(zl.getState()==2)
			{
				zl.setStatename("ȡ��");
			}else if(zl.getState()==3)
			{
				zl.setStatename("�ⵥ");
			}else if(zl.getState()==4)
			{
				zl.setStatename("δ�µ�");
			}
			if(zl.getTableid()!=0)
			{
				int id=zl.getTableid();
				System.out.println("id="+id);
				String name=qdService.findtableByid(id).getName();
				System.out.println("name="+name);
				zl.setTablename(name);
			}
			if(zl.getWaiterid()!=0)
			{
				zl.setWaitername(qdService.findempByid(zl.getWaiterid()).getName());
			}
			if(zl.getCashierid()!=0)
			{
				zl.setCashiername(qdService.findempByid(zl.getCashierid()).getName());
			}
			
			if(zl.getSendman()!=0)
			{
				zl.setSendname(qdService.findempByid(zl.getSendman()).getName());
			}
			
			if(zl.getVip()!=0)
			{
				zl.setVipname(qdService.findvipByid(zl.getVip()).getName());
			}
			if(qdService.findAlljiezhang(zl.getId())!=null)
			{
				zl.setAid("[��]"+qdService.findAlljiezhang(zl.getId()).getAid());
			}

		}
 		pb.setList(pblist);
		model.addAttribute("zls", pb);
		model.addAttribute("url", "qingdan/findAllQingDan.do");
		if(t==1){
			return "/pages/zzy/QingDan.jsp";
		}else{
			return "/pages/zzy/QingDanquhui.jsp";
		}		
	}
	@RequestMapping("queryQingDan")
	public String queryQingDan(Model model,int pageNum,int t,int qdtype,int qdstate,String qddate1,String qddate2,int qdyysd)throws Exception
	{
		System.out.println(qdtype+"---"+qdstate+"---"+qddate1+"---"+qddate2+"---"+qdyysd);
		QueryQingDanFenye qqdf=new QueryQingDanFenye();
		qqdf.setQdtype(qdtype);
		qqdf.setQdstate(qdstate);
		qqdf.setQddate1(qddate1);
		qqdf.setQddate2(qddate2);
		qqdf.setQdyysd(qdyysd);
		List<ZList> zls=qdService.findlistjuqery(qqdf);
		System.out.println(zls.size());
		int pagesize=11;
 		int totalRecord=zls.size();//�ܼ�¼
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		qqdf.setStart(start);
 		qqdf.setEnd(end);
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize);
 		List<ZList> pblist=qdService.getBylistFenye(qqdf);
 		System.out.println("��ҳ������" + pblist.size());
		for(ZList zl:pblist)
		{
			if(zl.getType()==0)
			{
				zl.setTypename("��ʳ");
			}else if(zl.getType()==1)
			{
				zl.setTypename("���");
			}else if(zl.getType()==2)
			{
				zl.setTypename("����");
			}
			/*0-�µ���1-�ѽ��ˣ�2-ȡ����3-�ⵥ��4-δ�µ�*/			
			if(zl.getState()==0)
			{
				zl.setStatename("�µ�");
			}else if(zl.getState()==1)
			{
				zl.setStatename("�ѽ���");
			}else if(zl.getState()==2)
			{
				zl.setStatename("ȡ��");
			}else if(zl.getState()==3)
			{
				zl.setStatename("�ⵥ");
			}else if(zl.getState()==4)
			{
				zl.setStatename("δ�µ�");
			}
			if(zl.getTableid()!=0)
			{
				zl.setTablename(qdService.findtableByid(zl.getTableid()).getName());
			}
			if(zl.getWaiterid()!=0)
			{
				zl.setWaitername(qdService.findempByid(zl.getWaiterid()).getName());
			}
			if(zl.getCashierid()!=0)
			{
				zl.setCashiername(qdService.findempByid(zl.getCashierid()).getName());
			}
			
			if(zl.getSendman()!=0)
			{
				zl.setSendname(qdService.findempByid(zl.getSendman()).getName());
			}
			
			if(zl.getVip()!=0)
			{
				zl.setVipname(qdService.findvipByid(zl.getVip()).getName());
			}
			if(qdService.findAlljiezhang(zl.getId())!=null)
			{
				zl.setAid("[��]"+qdService.findAlljiezhang(zl.getId()).getAid());
			}
		}
 		pb.setList(pblist);

		model.addAttribute("zls", pb);
		model.addAttribute("url", "qingdan/queryQingDan.do");
		if(t==1){
			return "/pages/zzy/QingDan.jsp";
		}else{
			return "/pages/zzy/QingDanquhui.jsp";
		}
		
	}
	@RequestMapping("qdxiangqing")
	public String qdxiangqing(Model model,String id)throws Exception
	{
		if(id.indexOf("��")!=-1)
		{
			id=id.substring(0, id.indexOf("["));
		}
		ZList zl=qdService.findlistByid(id);
			System.out.println(zl.getWaiterid());
			if(zl.getType()==0)
			{
				zl.setTypename("��ʳ");
			}else if(zl.getType()==1)
			{
				zl.setTypename("���");
			}else if(zl.getType()==2)
			{
				zl.setTypename("����");
			}
			/*0-�µ���1-�ѽ��ˣ�2-ȡ����3-�ⵥ��4-δ�µ�*/			
			if(zl.getState()==0)
			{
				zl.setStatename("�µ�");
			}else if(zl.getState()==1)
			{
				zl.setStatename("�ѽ���");
			}else if(zl.getState()==2)
			{
				zl.setStatename("ȡ��");
			}else if(zl.getState()==3)
			{
				zl.setStatename("�ⵥ");
			}else if(zl.getState()==4)
			{
				zl.setStatename("δ�µ�");
			}
			if(zl.getTableid()!=0)
			{
				zl.setTablename(qdService.findtableByid(zl.getTableid()).getName());
			}
			if(zl.getWaiterid()!=0)
			{
				zl.setWaitername(qdService.findempByid(zl.getWaiterid()).getName());
			}
			if(zl.getCashierid()!=0)
			{
				zl.setCashiername(qdService.findempByid(zl.getCashierid()).getName());
			}
			
			if(zl.getSendman()!=0)
			{
				zl.setSendname(qdService.findempByid(zl.getSendman()).getName());
			}
			
			if(zl.getVip()!=0)
			{
				zl.setVipname(qdService.findvipByid(zl.getVip()).getName());
			}
			if(qdService.findAlljiezhang(zl.getId())!=null)
			{
				zl.setAid("[��]"+qdService.findAlljiezhang(zl.getId()).getAid());
			}			

			System.out.println(id);
			List<Listinfo> ls=qdService.findListinfo(id);
			System.out.println("dingdan"+ls.size());
			for(Listinfo lss:ls)
			{
				System.out.println("caimin"+lss.getCainame());
			}
			model.addAttribute("lss", ls);
			model.addAttribute("list", zl);
		return "/pages/zzy/queryQingDan.jsp";
	}
}
