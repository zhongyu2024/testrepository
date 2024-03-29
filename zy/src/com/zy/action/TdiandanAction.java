package com.zy.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;



import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zy.bean.CookBook;
import com.zy.bean.Food;
import com.zy.bean.Foodtable;
import com.zy.bean.Hetable;
import com.zy.bean.Kitchenkucun;
import com.zy.bean.Listinfo;
import com.zy.bean.ListinfoModel;
import com.zy.bean.Mode;
import com.zy.bean.PageBean;
import com.zy.bean.QueryTime;
import com.zy.bean.Vip;
import com.zy.bean.VipRecord;
import com.zy.bean.Waitnum;
import com.zy.bean.ZList;
import com.zy.service.KuaicanService;
import com.zy.service.TdiandanService;

/**
 * ��ʳ�㵥���Ʋ�
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/Tdiandan")
public class TdiandanAction {

	@Resource
	private TdiandanService ts;
	public void setTs(TdiandanService ts) {
		this.ts = ts;
	}
	/**
	 * ���η���չ��ҳ��
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showdiandan")
	public String showKuaican(Model model,String listid)throws Exception{
		
		return show(model,listid);
	}
	/**
	 * ajax���ݲ�ϵ��ѯ��Ʒ��Ϣ
	 * @param typeid
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showByType")
	public String showByType(int typeid,Model model)throws Exception{
		List<Food> lists;
		if(typeid==0){
			//��ѯȫ����Ʒ
			lists=ts.getAllFood();
		}else{
			//���ݲ�ϵ��ѯ��Ʒ
			lists=ts.getByType(typeid);
		}
		yanzheng(lists);		
		model.addAttribute("foods", lists);
		return "/pages/xfr/foodinfo.jsp";
	}
	/**
	 * ajax�ж�ĳһ����Ƿ��㹻�û��������
	 * @param cainame
	 * @param num
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jisuan")
	public String jisuan(String cainame,int num,int typeid,Model model)throws Exception{
		//System.out.println(cainame+"--"+num+"--"+typeid);
		//�������ֲ�ѯ��Ʒ����
		Food food=ts.getByName(cainame);
		
		//��ȡ�ò�Ʒ����Ĳ��ϼ���
		List<CookBook> ms=ts.getCaipuByFoodid(food.getId());
		for(CookBook ck:ms){
			//ȥ��������и��²�������
			boolean b=ts.updateKucun(num*ck.getNum(), ck.getMaterialsid());
		}	
		List<Food> lists;
		if(typeid==0){
			//��ѯȫ����Ʒ
			lists=ts.getAllFood();
		}else{
			//���ݲ�ϵ��ѯ��Ʒ
			lists=ts.getByType(typeid);
		}
		yanzheng(lists);		
		model.addAttribute("foods", lists);
		return "/pages/xfr/foodinfo.jsp";		
	}
	/**
	 * ��ѯĳ����Ʒ��ʣ������
	 * @param cainame
	 * @throws Exception
	 */
	@RequestMapping("/checkNum")
	public void checkNum(String cainame,HttpServletResponse response)throws Exception{
		//System.out.println(cainame);
		int maxnum=1000000;//�������ķ���
		//���ݲ�����ȡ��Ʒ����
		Food food=ts.getByName(cainame);		
		//���ݲ�Ʒ��ȡ�䷽
		List<CookBook> ms=ts.getCaipuByFoodid(food.getId());
		//�����䷽����������в�ѯ�����
		for(CookBook cb:ms){				
			//����ò�Ʒ��ʣ�����
			Kitchenkucun kk=ts.getByMaterialsid(cb.getMaterialsid());
			int x=(int)(kk.getNum()/cb.getNum());
			maxnum=maxnum<=x?maxnum:x;
		}
		//ajax����
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(maxnum);
		out.flush();
		out.close();
	}
	/**
	 *�µ�
	 * @param model
	 * @param listinfo
	 * @param zl
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zuofei")
	public String zuofei(Model model,ListinfoModel listinfo,ZList zl) throws Exception{	
		//System.out.println("sssssssssssss");
		String id=listinfo.getLists().get(0).getListid();//��ȡ�������		
		double money=0;
		for(Listinfo l:listinfo.getLists()){
			l.setPrice(l.getMoney()/l.getNum());
			money+=l.getMoney();
		}
		zl.setPaymoney(money);
		zl.setId(id);
		//��֮ǰ�Ķ������޸�
		//���µĲ�Ʒ��Ϣ���뵽�嵥�������
		ts.subTjiezhang(zl,listinfo.getLists());		
		//���·���ҳ��
		return "/pages/xfr/tiaozhuan.jsp";
		
	}
	/**
	 * �˲�
	 * @param id
	 */
	@RequestMapping("/tuicai")
	public String tuicai(int id,String liyou,Model model){
		//����id���ҳ��ö���
		Listinfo listinfo=ts.getlistinfoByid(id);		
		//���˲˵Ķ��������еĲ�ƷǮ�޸�Ϊ0���Ҽ��ϱ�ע
		ts.editlistinfo(id,"�˲�:"+liyou);
		//�����������ѽ���޸�
		ts.editlistxiaofei(listinfo);
		return show(model, listinfo.getListid());
	}
	/**
	 * ȡ�ؽ������ϲ���
	 * @param listid
	 * @param model
	 * @return
	 */
	@RequestMapping("/quhuizuofei")
	public String quhuizuofei(String listid,Model model){
		ZList z=ts.getListByid(listid);
		//�޸Ķ���״̬
		ts.edilistzuofei(listid,z.getTableid());
		return fasongquhui(model,1,1);
	}
	/**
	 * ȡ�ؽ��水�ƺ�����
	 * @param waitnum
	 * @return
	 */
	@RequestMapping("/search")
	public String search(int waitnum,Model model){
		List<ZList> z=ts.getBywaitnum(waitnum);
		PageBean<ZList> pb=new PageBean<ZList>(1, z.size(), 1);
		pb.setList(z);
		model.addAttribute("zls", pb);
		model.addAttribute("url", "Kuaican/search.do");
		return "/pages/xfr/quhuilist.jsp";
	}
	/**
	 * ȡ�ؽ��水ʱ������
	 * @param time
	 * @param model
	 * @return
	 */
	@RequestMapping("/getBytime")
	public String getBytime(int time,Model model,int pageNum){
		int pageSize=1;
		int start=0;
		int end =0;
		if(time==0){
			//��ѯȫ��
			
		}else if(time==10){
			end=10*60;
		}else if(time==20){
			start=10*60;
			end=20*60;
		}else if(time==40){
			start=20*60;
			end=40*60;
		}else if(time==60){
			start=40*60;
			end=60*60;
		}else {
			start=60*60;
			end=120*60;
		}
		int start1=(pageNum-1)*pageSize+1;
		int end1=pageNum*pageSize;
		QueryTime qm=new QueryTime(start,end,start1,end1);
		List<ZList> zls=ts.getBytimeAll(qm);
		PageBean<ZList> pb=new PageBean<ZList>(pageNum, zls.size(), pageSize);			
		pb.setList(ts.getBytimeFenye(qm));
		model.addAttribute("zls", pb);
		model.addAttribute("url","Kuaican/getBytime.do");
		return "/pages/xfr/quhuilist.jsp";
	}
	/**
	 * ��ʳ�㵥����չʾ����ҳ��
	 * @param danhao
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jiezhang")
	public String jiezhang(Model model,ListinfoModel listinfo,String tid)throws Exception{	
		
		
		if(listinfo.getLists()!=null){
			//���²�Ʒ��Ϣ��Ҫ����
			ts.subjiezhang(listinfo.getLists());
		}
		ZList zlist=ts.getListByid(tid);
		//�������յĲ�Ʒ����
		List<Listinfo> newlist=ts.getbylistid(tid);
		//�������յĶ���
		ZList newzl=zlist;
		
		List<Hetable> hts=ts.gethtByAid(tid);
		List<Hetable> hts2=ts.gethtByBid(tid);
		if(hts.size()>0){
			//�ҵ���̨��¼���Ҹö����Ǹ�����
			for(Hetable ht:hts){
				ZList z6=ts.getListByid(ht.getBid());
				newzl.setPaymoney(newzl.getPaymoney()+z6.getPaymoney());
				//�������е��Ӷ����������ҵ���Ӧ�Ĳ�Ʒ��Ϣ
				List<Listinfo> lis=ts.getbylistid(ht.getBid());
				if(lis.size()>0){
					for(Listinfo l2:lis){
						newlist.add(l2);
					}
				}
				
			}
		}else if(hts2.size()>0){
			//�õ�����������
			newzl=ts.getListByid(hts2.get(0).getAid());			
			//��ȡ���ӵ��ĸ����Ĳ�Ʒ����
			List<Listinfo> fucai=ts.getbylistid(hts2.get(0).getAid());
			for(Listinfo l4:fucai){
				newlist.add(l4);
			}
			//��ȡ���Ӷ����ĸ������µ������Ӷ�������
			List<Hetable> hts3=ts.gethtByAid(hts2.get(0).getAid());
			if(hts3.size()>0){
				for(Hetable ht:hts3){
					ZList z6=ts.getListByid(ht.getBid());
					newzl.setPaymoney(newzl.getPaymoney()+z6.getPaymoney());
					//�������е��Ӷ����������ҵ���Ӧ�Ĳ�Ʒ��Ϣ
					if(!ht.getBid().equals(tid)){//�ų���ǰ�Ӷ���
						List<Listinfo> lis=ts.getbylistid(ht.getBid());
						if(lis.size()>0){
							for(Listinfo l2:lis){
								newlist.add(l2);
							}
						}
					}
				}
			}
		}		
		model.addAttribute("zlist",newzl);
		model.addAttribute("cailist", newlist);	
		model.addAttribute("types", "tangshi");		
		return "/pages/xfr/jiezhang.jsp";
	}
	/**
	 * ȡ�ؽ�����ת����
	 * @param model
	 * @param listid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/quhuijiezhang")
	public String quhuijiezhang(Model model,String listid)throws Exception{
		System.out.println(listid);
		ZList zl=ts.getListByid(listid);		
		List<Listinfo> lists=ts.getbylistid(listid);
		model.addAttribute("zlist", zl);
		model.addAttribute("cailist", lists);
		model.addAttribute("types", "quhui");	
		return "/pages/xfr/jiezhang.jsp";
	}
	/**
	 * ȡ�ؽ�������չʾ
	 * @param id
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getcailist")
	public String getcailist(String id,Model model)throws Exception{
		List<Listinfo> lists=ts.getbylistid(id);
		model.addAttribute("foods",lists);
		return "/pages/xfr/quhuicailist.jsp";
	}
	/**
	 * �������
	 * @param zl
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/subjiezhang")
	public String subjiezhang(ZList zl,Model model)throws Exception {
		/*System.out.println("������ˣ�");
		System.out.println(zl.getVip()+"--"+zl.getId()+"--"+zl.getDazhemoney()+"--"+zl.getRealpay());*/
		zl.setCashierid(1);////////////////////
		
		List<Hetable> hts=ts.gethtByAid(zl.getId());
		if(hts.size()>0){
			//�к�̨��¼
			//�޸ĺ�̨��¼����������״̬
			ts.edithetable(zl.getId());
			for(Hetable ht:hts){
				ZList zz=ts.getListByid(ht.getBid());
				zz.setPaymoney(0);
				zz.setCashierid(1);////////////////////
				ts.subputongpay(zz);
				//�޸Ĳ���״̬���Լ���̨״̬
				ts.edittablestate(zz.getTableid());
			}
		}
		if(zl.getDazhemoney()!=0&&zl.getVip()!=0){
			//�ǻ�Ա֧��,���һ����Ա���Ѽ�¼,�����޸Ļ�Ա�˻����
			VipRecord vr=new VipRecord();
			vr.setVipid(zl.getVip());
			vr.setDoman(1);/////////////////////////
			vr.setListid(zl.getId());
			vr.setType(1);
			vr.setMoney(zl.getRealpay());
			ts.subvippay(vr,zl);			
		}else{
			ts.subputongpay(zl);
		}	
		return "/pages/xfr/tiaozhuan.jsp";
	}
	/**
	 * �����ֻ��Ż�ȡ��Ա����
	 * @param tel
	 */
	@RequestMapping("/getvip")
	public void  getvip(String tel,HttpServletResponse response)throws Exception{
		Vip vip=ts.getvip(tel);
		JSONArray js=new JSONArray().fromObject(vip);		
		response.setContentType("text/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.print(js.toString());
		out.flush();
		out.close(); 
	}
	/**
	 * չʾȡ��ҳ��
	 * @param model
	 * @param t 1-�״�չʾ��2-��ҳչʾ
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showquhui")
	public String showquhui(Model model,int pageNum ,int t)throws Exception{		
 		return fasongquhui(model,pageNum,t);
	}
	private String fasongquhui(Model model,int pageNum,int t){
		List<ZList> zls=ts.getlistBystateAndType(4,1);
 		int pagesize=1;
 		int totalRecord=zls.size();//�ܼ�¼
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize);
 		pb.setList(ts.getlistBystateAndTypeAndFenye(4, 1, start, end));
		model.addAttribute("zls", pb);
		model.addAttribute("url", "Kuaican/showquhui.do");
		if(t==1){
			return "/pages/xfr/quhui.jsp";
		}else{
			return "/pages/xfr/quhuilist.jsp";
		}
	}
	/**
	 * ����
	 * @param fs
	 * @return
	 */
	private void yanzheng(List<Food> fs){		
		//HashMap<Food, Integer> map=new HashMap<Food, Integer>();
		//������Ʒ�б�
		for(Food f:fs){
			//��ȡ�ò�Ʒ����Ĳ��ϼ���
			List<CookBook> ms=ts.getCaipuByFoodid(f.getId());
			if(ms.size()>0){
				int n=ms.size();//��¼�ò˵Ĳ������������
				for(CookBook cb:ms){				
					//��ѯÿ�ֲ��ϵĿ����
					Kitchenkucun kk=ts.getByMaterialsid(cb.getMaterialsid());
					if(kk!=null){
						if(kk.getNum()>=cb.getNum()){
							//����㹻
							n--;					
						}
					}
				}
				if(n==0){
					//�ò���������в��Ͼ�����㹻
					f.setIsguqing(0);					
				}else{
					f.setIsguqing(1);	
				}
			}else{
				f.setIsguqing(1);	
			}
		}
		
	}
	/**
	 * չʾ��ʼ��ʳ�㵥����
	 * @param model
	 * @return
	 */
	private String show(Model model,String listid){
		//��ǰѡ�еĶ���
				ZList zl=ts.getListByid(listid);
				Foodtable ft=ts.getFtByid(zl.getTableid());
				zl.setTablename(ft.getName());
				int allnum=0;//�ö����µ������
				List<Listinfo> ll=ts.getbylistid(listid);		
				for(Listinfo lll:ll){
					if(lll!=null){
						allnum+=lll.getNum();
					}
				}
				List<Food> foods=ts.getAllFood();
				List<Mode> cooktypes=ts.getAllCookType();
				//System.out.println(cooktypes.size()+"sssssssssssssssss");
				List<Mode> yaoqius=ts.getAllYaoqiu();
				List<Mode> liyou=ts.getALLliyou();
				yanzheng(foods);
				model.addAttribute("zl", zl);
				model.addAttribute("allnum", allnum);
				model.addAttribute("lists", ll);
				model.addAttribute("foods", foods);
				model.addAttribute("cts", cooktypes);
				model.addAttribute("lys", liyou);
				model.addAttribute("yqs", yaoqius);
				return "/pages/xfr/tangshi.jsp";
	}
	
	
}
