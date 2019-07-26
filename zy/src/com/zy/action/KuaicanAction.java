package com.zy.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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

/**
 * ��Ϳ��Ʋ�
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/Kuaican")
public class KuaicanAction {

	@Resource
	private KuaicanService ks;
	public void setKs(KuaicanService ks) {
		this.ks = ks;
	}
	/**
	 * ���η���չ��ҳ��
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showKuaican")
	public String showKuaican(Model model)throws Exception{		
		return show(model);
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
			lists=ks.getAllFood();
		}else{
			//���ݲ�ϵ��ѯ��Ʒ
			lists=ks.getByType(typeid);
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
		Food food=ks.getByName(cainame);
		
		//��ȡ�ò�Ʒ����Ĳ��ϼ���
		List<CookBook> ms=ks.getCaipuByFoodid(food.getId());
		for(CookBook ck:ms){
			//ȥ��������и��²�������
			boolean b=ks.updateKucun(num*ck.getNum(), ck.getMaterialsid());
		}	
		List<Food> lists;
		if(typeid==0){
			//��ѯȫ����Ʒ
			lists=ks.getAllFood();
		}else{
			//���ݲ�ϵ��ѯ��Ʒ
			lists=ks.getByType(typeid);
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
		Food food=ks.getByName(cainame);		
		//���ݲ�Ʒ��ȡ�䷽
		List<CookBook> ms=ks.getCaipuByFoodid(food.getId());
		//�����䷽����������в�ѯ�����
		for(CookBook cb:ms){				
			//����ò�Ʒ��ʣ�����
			Kitchenkucun kk=ks.getByMaterialsid(cb.getMaterialsid());
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
	 *��������϶���
	 * @param model
	 * @param listinfo
	 * @param zl���ƺ�״̬�� 0-���У�1-ռ��
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/zuofei")
	public String zuofei(Model model,ListinfoModel listinfo,ZList zl) throws Exception{	
		//System.out.println("sssssssssssss");
		String id=listinfo.getLists().get(0).getListid();//��ȡ�������
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ordertime=sf.format(new Date());
		double money=0;
		zl.setId(id);
		zl.setOrdertime(ordertime);
		for(Listinfo l:listinfo.getLists()){
			l.setPrice(l.getMoney()/l.getNum());
			money+=l.getMoney();
		}
		zl.setPaymoney(money);
		if(zl.getState()==2){
			//�ָ�֮ǰ���ݿ�ɾ���Ĳ�Ʒ������Ϣ
			for(Listinfo ll:listinfo.getLists()){
				//���ݲ�����ȡ��Ʒ����
				Food food=ks.getByName(ll.getCainame());				
				//��ȡ�ò�Ʒ����Ĳ��ϼ���
				List<CookBook> ms=ks.getCaipuByFoodid(food.getId());
				for(CookBook ck:ms){
					//ȥ��������и��²�������
					boolean b=ks.updateKucun(-ll.getNum()*ck.getNum(), ck.getMaterialsid());
				}
				
			}
			ks.subjiezhang(zl,listinfo.getLists(),0);			
		}else {
			ks.subjiezhang(zl,listinfo.getLists(),1);
		}
		//���·���ҳ��
		return show(model);
		
	}
	/**
	 * ȡ�ؽ������ϲ���
	 * @param listid
	 * @param model
	 * @return
	 */
	@RequestMapping("/quhuizuofei")
	public String quhuizuofei(String listid,Model model){
		ZList z=ks.getListByid(listid);
		//�޸Ķ���״̬
		ks.edilistzuofei(listid,z.getTableid());
		return fasongquhui(model,1,1);
	}
	/**
	 * ȡ�ؽ��水�ƺ�����
	 * @param waitnum
	 * @return
	 */
	@RequestMapping("/search")
	public String search(int waitnum,Model model){
		List<ZList> z=ks.getBywaitnum(waitnum);
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
		List<ZList> zls=ks.getBytimeAll(qm);
		PageBean<ZList> pb=new PageBean<ZList>(pageNum, zls.size(), pageSize);			
		pb.setList(ks.getBytimeFenye(qm));
		model.addAttribute("zls", pb);
		model.addAttribute("url","Kuaican/getBytime.do");
		return "/pages/xfr/quhuilist.jsp";
	}
	/**
	 * ��ͽ���չʾ����ҳ��
	 * @param danhao
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jiezhang")
	public String jiezhang(Model model,ListinfoModel listinfo,ZList zl)throws Exception{
		
		String id=listinfo.getLists().get(0).getListid();//��ȡ�������
		ZList zl1=ks.getListByid(id);
		if(zl1==null){			
			//δ�ύ������
			SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String ordertime=sf.format(new Date());
			double money=0;
			zl.setId(id);
			zl.setOrdertime(ordertime);
			for(Listinfo l:listinfo.getLists()){
				l.setPrice(l.getMoney()/l.getNum());
				money+=l.getMoney();
			}
			zl.setPaymoney(money);
			ks.subjiezhang(zl,listinfo.getLists(),0);		
		}
		model.addAttribute("zlist",zl);
		model.addAttribute("cailist", listinfo.getLists());	
		model.addAttribute("types", "kuaican");	
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
		ZList zl=ks.getListByid(listid);		
		List<Listinfo> lists=ks.getbylistid(listid);
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
		List<Listinfo> lists=ks.getbylistid(id);
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
	public String subjiezhang(ZList zl,Model model,String tts)throws Exception {
		/*System.out.println("������ˣ�");
		System.out.println(zl.getVip()+"--"+zl.getId()+"--"+zl.getDazhemoney()+"--"+zl.getRealpay());*/
		zl.setCashierid(1);////////////////////
		if(zl.getDazhemoney()!=0&&zl.getVip()!=0){
			//�ǻ�Ա֧��,���һ����Ա���Ѽ�¼,�����޸Ļ�Ա�˻����
			VipRecord vr=new VipRecord();
			vr.setVipid(zl.getVip());
			vr.setDoman(1);/////////////////////////
			vr.setListid(zl.getId());
			vr.setType(1);
			vr.setMoney(zl.getRealpay());
			ks.subvippay(vr,zl);			
		}else{
			ks.subputongpay(zl);
		}		
		//���·���ҳ��
		if(tts.equals("kuaican")){
			return show(model);	
		}else {//if(tts.equals("quhui"))
			return fasongquhui(model,1,1);
		}
	}
	/**
	 * �����ֻ��Ż�ȡ��Ա����
	 * @param tel
	 */
	@RequestMapping("/getvip")
	public void  getvip(String tel,HttpServletResponse response)throws Exception{
		Vip vip=ks.getvip(tel);
		//System.out.println("--"+vip.getCount()+"ssssssssssssssssssssssssssssss");
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
		List<ZList> zls=ks.getlistBystateAndType(4,1);
 		int pagesize=1;
 		int totalRecord=zls.size();//�ܼ�¼
 		int start=(pageNum-1)*pagesize+1;
 		int end=pageNum*pagesize;
 		PageBean<ZList> pb=new PageBean<ZList>(pageNum, totalRecord, pagesize);
 		pb.setList(ks.getlistBystateAndTypeAndFenye(4, 1, start, end));
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
			List<CookBook> ms=ks.getCaipuByFoodid(f.getId());
			if(ms.size()>0){
				int n=ms.size();//��¼�ò˵Ĳ������������
				for(CookBook cb:ms){				
					//��ѯÿ�ֲ��ϵĿ����
					Kitchenkucun kk=ks.getByMaterialsid(cb.getMaterialsid());
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
	 * չʾ��ʼ��ͽ���
	 * @param model
	 * @return
	 */
	private String show(Model model){
		List<Food> foods=ks.getAllFood();
		List<Waitnum> nums=ks.getByState(0);
		List<Mode> cooktypes=ks.getAllCookType();
		List<Mode> yaoqius=ks.getAllYaoqiu();
		yanzheng(foods);		
		model.addAttribute("foods", foods);
		model.addAttribute("nums", nums);
		model.addAttribute("cks", cooktypes);
		model.addAttribute("yqs", yaoqius);
		return "/pages/xfr/kuaican.jsp";
	}
	
	
}
