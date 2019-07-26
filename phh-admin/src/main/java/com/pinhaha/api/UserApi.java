/**
 * 
 */
package com.pinhaha.api;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.mapper.AdminSendSmsMapper;
import com.pinhaha.mapper.AppAccountLogMapper;
import com.pinhaha.mapper.AppPointMapper;
import com.pinhaha.mapper.AppUserAccountMapper;
import com.pinhaha.mapper.AppUserMapper;
import com.pinhaha.mapper.UserGetMoneyMapper;
import com.pinhaha.mapper.UserGetVoucherMoneyMapper;
import com.pinhaha.pojo.AdminSendSms;
import com.pinhaha.pojo.AppAccountLog;
import com.pinhaha.pojo.AppUser;
import com.pinhaha.pojo.AppUserAccount;
import com.pinhaha.pojo.AppVoucherMoney;
import com.pinhaha.pojo.MemberLevel;
import com.pinhaha.pojo.UserGetMoney;
import com.pinhaha.pojo.UserGetVoucherMoney;
import com.pinhaha.util.CookieUtil;
import com.pinhaha.util.DateUtil;
import com.pinhaha.util.ImageAndQRcode;
import com.pinhaha.util.SmsUtil;

import lombok.extern.slf4j.Slf4j;

/**
*	<p>Title: </p>
* 	<p>Description: </p>
* 	<p>Company: </p> 
* 	@author zhongyu2024
* 	@date 2018年11月16日
*/

@Slf4j
@RestController
@RequestMapping("userapi")
public class UserApi {
	
	@Autowired
	private AppUserMapper usermapper;
	
	@Autowired
	private AppUserAccountMapper useraccountmapper;
	
	@Autowired
	private AppAccountLogMapper logmapper;
	
	@Autowired
	private UserGetMoneyMapper getmoneymapper;
	
	@Autowired
	private UserGetVoucherMoneyMapper getvouchermoneymapper;
	
	@Autowired
	private AppPointMapper pointmapper;
	
	@Autowired
	private AdminSendSmsMapper adminSendSmsMapper;
	
	@Value("${cookie_domain}")
	private String cookie_domain;
	
	@Value("${admin_sms_phone}")
	private String admin_sms_phone;
	
	@Value("${img_path}")
	private String img_path;

	@RequestMapping("userlist")
	public Map<String, Object> userlist(@RequestParam Map<String,Object> map){
		//System.out.println(map.toString());
		
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		
		PageHelper.startPage(page, limit);
		List<AppUser> list = usermapper.getUserByParams(map);
		PageInfo<AppUser> pageInfo = new PageInfo<AppUser>(list);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("getVipUser")
	public Map<String, Object> getVipUser(@RequestParam Map<String,Object> map){
		//System.out.println(map.toString());
		
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		
		PageHelper.startPage(page, limit);
		List<AppUser> list = usermapper.getVipUser(map);
		PageInfo<AppUser> pageInfo = new PageInfo<AppUser>(list);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("updateuser")
	public int updateuser(int is_active,int is_delete,int user_id){
		usermapper.updateUser(is_active,is_delete,user_id);
		return 1;
	}
	
	@RequestMapping("getlevel")
	public List<MemberLevel> getlevel(){
		
		return usermapper.getlevel();
	}
	
	@RequestMapping("allgetmoneyinfo")
	public Map<String, Object>  allgetmoneyinfo(@RequestParam Map<String,Object> map){
		//System.out.println(map.toString());
		
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		PageHelper.startPage(page, limit);
		List<UserGetMoney> list = usermapper.allgetmoneyinfo(map);
		PageInfo<UserGetMoney> pageInfo = new PageInfo<UserGetMoney>(list);
		
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", pageInfo);
		map2.put("count", pageInfo.getTotal());
		map2.put("data", list);
		return map2;
	}
	
	/**
	 * 提现
	 * @param is_check
	 * @param is_pay
	 * @param id
	 * @param user_id
	 * @param amount
	 * @return
	 */
	@Transactional
	@RequestMapping("updategetmoney")
	public int updategetmoney(int is_pay,int id,Long user_id,BigDecimal amount,String order_sn){
		
		try {
			
			//提现
			usermapper.updateGetMoney(is_pay,order_sn, id);
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return 0;
		}
		
	}
	
	
	/**
	 * 提现
	 * @param is_check
	 * @param is_pay
	 * @param id
	 * @param user_id
	 * @param amount
	 * @return
	 */
	@Transactional
	@RequestMapping("refusegetmoney")
	public int refusegetmoney(int is_pay,int id){
		
		try {
			
			UserGetMoney gm=getmoneymapper.selectByPrimaryKey(id);
			gm.setIs_pay(2);
			gm.setIs_check(1);
			getmoneymapper.updateByPrimaryKey(gm);
			
			BigDecimal bValue=gm.getAmount();
			
			
			//减少金额
			AppUserAccount account=useraccountmapper.getBeforeAmount(gm.getUser_id());
			BigDecimal bm = account.getTotal_amount();
			useraccountmapper.UserAccountGetMoney(bValue, account.getId());
			
			//添加log
			AppAccountLog l = new AppAccountLog();
			l.setUser_id(gm.getUser_id());
			l.setChange_amount(bValue);
			l.setBefore_amount(bm);
			l.setCreate_time(new Date());
			l.setType(7);
			l.setMessage("用户Id:"+gm.getUser_id()+",提现拒绝,返还提现暂扣金额"+bValue+"元。");
			logmapper.insert(l);	
			
			return 1;
		} catch (Exception e) {
			// TODO: handle exception
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return 0;
		}
		
	}
	
	//更新订单号
	@RequestMapping("updateOrderSn")
	public int updateOrderSn(Long id,String order_sn){
		UserGetMoney u = getmoneymapper.selectByPrimaryKey(id);
		u.setOrder_sn(order_sn);
		getmoneymapper.updateByPrimaryKeySelective(u);
		return 1;
	}
	
	//积分
	@RequestMapping("allGradeList")
	public  Map<String, Object> allGradeList(@RequestParam Map<String,Object> map){
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		
		List<Map<String,Object>> list = pointmapper.getAll(map);
		for(int i=0;i<list.size();i++){
			list.get(i).put("id", i+1);
		}
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", "suc");
		map2.put("count", pointmapper.getAllCount(map));
		map2.put("data", list);
		return map2;
	}
	
	//账单
	@RequestMapping("allBillList")
	public  Map<String, Object> allBillList(@RequestParam Map<String,Object> map){
		Integer page=Integer.parseInt((String) map.get("page"));
		Integer limit=Integer.parseInt((String) map.get("limit"));
		map.put("page", (page-1)*limit);
		map.put("limit", limit);
		
		List<AppAccountLog> list = logmapper.getAllBill(map);
		for(int i=0;i<list.size();i++){
			list.get(i).setId(i+1L);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("code", 0);
		map2.put("msg", "suc");
		map2.put("count", logmapper.getAllBillCount(map));
		map2.put("data", list);
		return map2;
	}
	
	@RequestMapping("login")
	public int login(@RequestParam("uname")String uname,
						@RequestParam("pwd") String pwd,
						HttpServletRequest request,
						HttpServletResponse response){
		if(uname.equals("admin") && pwd.equals("admin")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "1", cookie_domain);
			return 1 ;
		}
		if(uname.equals("tuiyi001") && pwd.equals("tuiyi001")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "2", cookie_domain);
			return 1 ;
		}
		if(uname.equals("tuiyi002") && pwd.equals("tuiyi002")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "3", cookie_domain);
			return 1 ;
		}
		if(uname.equals("tuiyi003") && pwd.equals("tuiyi003")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "4", cookie_domain);
			return 1 ;
		}
		if(uname.equals("tuiyi004") && pwd.equals("tuiyi004")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "5", cookie_domain);
			return 1 ;
		}
		if(uname.equals("tuiyi005") && pwd.equals("tuiyi005")){
			log.info("true");
			CookieUtil.createCookie(request, response, "admin", "6", cookie_domain);
			return 1 ;
		}
		log.info("f");
		return 0;
	}
	
	
	
	@RequestMapping(value = "/uploadSoldierImg", method = RequestMethod.POST)
	public Object uploadSoldierImg(@RequestParam("imgStr") String imgStr, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int code = -1;
		String fileName = "";
		if (imgStr.contains("jpg;")) {
			fileName = UUID.randomUUID() + ".jpg";
		} else if (imgStr.contains("png;")) {
			fileName = UUID.randomUUID() + ".jpg";
		} else if (imgStr.contains("jpeg;")) {
			fileName = UUID.randomUUID() + ".jpeg";
		}
		Map<String, Object> rsp = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		imgStr=imgStr.substring(imgStr.indexOf("base64,")+("base64,").length(), imgStr.length());
		try {
			// Base64解码
			byte[] b = Base64.decodeBase64(imgStr);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			FileOutputStream out = new FileOutputStream(new File(img_path +"/static_file/upload_img/"+ fileName));
			out.write(b);
			out.flush();
			out.close();
			code = 0;
		} catch (Exception e) {
			rsp.put("success", false);
			rsp.put("message", "上传失败,请重试！！");
			rsp.put("entity", null);
			response.setHeader("Access-Control-Allow-Origin","*");
			return rsp;
		}
		result.put("code", code);
		result.put("img_url", fileName);
		rsp.put("success", true);
		rsp.put("message", "成功！！");
		rsp.put("entity", result);
		response.setHeader("Access-Control-Allow-Origin","*");
		return rsp;
	}
	
	
	
	
	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	public Object uploadImg(@RequestParam(value="imgStr",required=false) String imgStr,@RequestParam(value="nickname",required=false) String nickname,@RequestParam("userId") Long userId, HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		userId=!StringUtils.isEmpty(request.getHeader("Access-UseId"))?Long.valueOf(request.getHeader("Access-UseId")):null;
		int code = -1;
		String fileName = "";
		if (imgStr.contains("jpg;")) {
			fileName = UUID.randomUUID() + ".jpg";
		} else if (imgStr.contains("png;")) {
			fileName = UUID.randomUUID() + ".jpg";
		} else if (imgStr.contains("jpeg;")) {
			fileName = UUID.randomUUID() + ".jpeg";
		}
		Map<String, Object> rsp = new HashMap<String, Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		if(StringUtils.isEmpty(imgStr)){
			code=1;
		}else{
			imgStr=imgStr.substring(imgStr.indexOf("base64,")+("base64,").length(), imgStr.length());
			try {
				// Base64解码
				byte[] b = Base64.decodeBase64(imgStr);
				for (int i = 0; i < b.length; ++i) {
					if (b[i] < 0) {// 调整异常数据
						b[i] += 256;
					}
				}
				FileOutputStream out = new FileOutputStream(new File(img_path +"/static_file/upload_img/"+ fileName));
				out.write(b);
				out.flush();
				out.close();
				code = 0;
			} catch (Exception e) {
				rsp.put("success", false);
				rsp.put("message", "上传失败,请重试！！");
				rsp.put("entity", null);
				response.setHeader("Access-Control-Allow-Origin","*");
				return rsp;
			}
		}
		
		
		if(code==0){
			AppUser user=usermapper.selectByPrimaryKey(userId);
			user.setImg_url(fileName);
			user.setReal_name(nickname);
			usermapper.updateByPrimaryKey(user);
		}
		
		if(code==1){
			AppUser user=usermapper.selectByPrimaryKey(userId);
			user.setReal_name(nickname);
			usermapper.updateByPrimaryKey(user);
		}
		result.put("code", code);
		result.put("img_url", fileName);
		rsp.put("success", true);
		rsp.put("message", "成功！！");
		rsp.put("entity", result);
		response.setHeader("Access-Control-Allow-Origin","*");
		return rsp;
	}
	
	
	@RequestMapping(value = "/createImageTemp", method = RequestMethod.POST)
	public Object createImageTemp(@RequestParam("order") String order,@RequestParam("x") Integer x,@RequestParam("y") Integer y,@RequestParam("qrSize") Integer qrSize,HttpServletRequest request, HttpServletResponse response) throws IOException {
		Long userId=!StringUtils.isEmpty(request.getHeader("Access-UseId"))?Long.valueOf(request.getHeader("Access-UseId")):null;
		String fileName = "shareTemp"+order+"_"+userId+".jpg";
		String fileName2 = "shareTemp"+order+"_"+userId + "qr.png";
		
		ImageAndQRcode add = new ImageAndQRcode();
		AppUser user=usermapper.selectByPrimaryKey(userId);
		try { 
			add.addImageQRcode("http://phaha.tuiyizx.com/web/shareCourse?inviteCode="+user.getInvite_code(), qrSize, qrSize,"png", img_path +"/static_file/upload_img/model"+order+".jpg",
					img_path +"/static_file/upload_img/"+fileName2,img_path +"/static_file/upload_img/"+ fileName,x,y,"我是"+user.getUser_name());
			
		} catch (Exception e) {
			Map<String, Object> rsp=new HashMap<>();
			rsp.put("success", false);
			rsp.put("message", "获取图片异常！！");
			response.setHeader("Access-Control-Allow-Origin","*");
			return rsp;
		}finally {
			File file2=new File(img_path +"/static_file/upload_img/"+fileName2);
			if(file2.exists()){
				file2.delete();
			}
		}
		
		Map<String, Object> rsp=new HashMap<>();
		rsp.put("success", true);
		rsp.put("message", "成功！！");
		rsp.put("entity", fileName);
		response.setHeader("Access-Control-Allow-Origin","*");
		return rsp;
	}
	
	/**
	 * 
	 * Description:
	 * @see This class {phh-admin} code is all, prohibit other projects that are not the company's project.
	 * @author shiquanli
	 *    <br/><p>15257129351@163.com</p>
	 *    <br/><p>1695446827@qq.com</p>
	 *    <br/>DATE ： 2019年3月1日 下午3:57:42
	 */
	@RequestMapping("manage_json.json")
	public String loginManageJson(HttpServletRequest request){
		String json = "";
		String loginAdmin = (String) CookieUtil.getCookieValue(request, "admin");
		switch (loginAdmin) {
		case "1":
			json = "{ 	\"contentManagement\": [{\"title\": \"积分管理\",\"icon\": \"&#xe630;\",\"href\": \"grade\",\"spread\": false},{\"title\": \"账单管理\",\"icon\": \"&#xe630;\",\"href\": \"bill\",\"spread\": false},{\"title\": \"提现管理\",\"icon\": \"&#xe630;\",\"href\": \"getmoney\",\"spread\": false},{\"title\": \"首页轮播图管理\",\"icon\": \"&#xe630;\",\"href\": \"indexPic\",\"spread\": false},{\"title\": \"商家管理\",\"icon\": \"&#xe630;\",\"href\": \"ins\",\"spread\": false},{\"title\": \"商户提现管理\",\"icon\": \"&#xe630;\",\"href\": \"insgetmoney\",\"spread\": false},{\"title\": \"代金券提现管理\",\"icon\": \"&#xe630;\",\"href\": \"getvouchermoney\",\"spread\": false},{\"title\": \"用户管理\",\"icon\": \"&#xe630;\",\"href\": \"userlist\",\"spread\": false},{\"title\": \"分类管理\",\"icon\": \"&#xe630;\",\"href\": \"category\",\"spread\": false},{\"title\": \"课程管理\",\"icon\": \"&#xe630;\",\"href\": \"course\",\"spread\": false},{\"title\": \"精品课程管理\",\"icon\": \"&#xe630;\",\"href\": \"goodcourse\",\"spread\": false},{\"title\": \"老师管理\",\"icon\": \"&#xe630;\",\"href\": \"teacher/list\",\"spread\": false},{\"title\": \"学习码管理\",\"icon\": \"&#xe630;\",\"href\": \"xuexima/list\",\"spread\": false},{\"title\": \"军人/残疾人升级VIP管理\",\"icon\": \"&#xe630;\",\"href\": \"soldier/list\",\"spread\": false},{\"title\": \"代理管理\",\"icon\": \"&#xe716;\",\"href\": \"\",\"spread\": false,\"children\": [	{		\"title\": \"省代管理\",		\"icon\": \"&#xe66c;\",		\"href\": \"daili/list-province\",		\"spread\": false	},	{		\"title\": \"市代管理\",		\"icon\": \"&#xe66c;\",		\"href\": \"daili/list-city\",		\"spread\": false	},	{		\"title\": \"股东管理\",		\"icon\": \"&#xe66c;\",		\"href\": \"daili/list-shareholder\",		\"spread\": false	},	{		\"title\": \"添加会员(不计算收益)\",		\"icon\": \"&#xe66c;\",		\"href\": \"daili/add_lev1\",		\"spread\": false	},	{		\"title\": \"代客户拆分会员(计算收益)\",		\"icon\": \"&#xe66c;\",		\"href\": \"daili/chaifen_lev\",		\"spread\": false	}]} 	], 	\"seraphApi\": [{\"title\": \"三级联动模块\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/addressDoc.html\",\"spread\": false},{\"title\": \"bodyTab模块\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/bodyTabDoc.html\",\"spread\": false},{\"title\": \"三级菜单\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/navDoc.html\",\"spread\": false} 	] }   ";
			break;
		default:
			json = "{ 	\"contentManagement\": [{\"title\": \"用户管理\",\"icon\": \"&#xe630;\",\"href\": \"userlist\",\"spread\": false}], 	\"seraphApi\": [{\"title\": \"三级联动模块\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/addressDoc.html\",\"spread\": false},{\"title\": \"bodyTab模块\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/bodyTabDoc.html\",\"spread\": false},{\"title\": \"三级菜单\",\"icon\": \"icon-mokuai\",\"href\": \"page/doc/navDoc.html\",\"spread\": false} 	] }   ";
			break;
		}
	    return json;
	}
	
	
	@RequestMapping(value = "/checkMobile", method = RequestMethod.POST)
	public Object checkMobile(@RequestParam("num") String num,HttpServletRequest request, HttpServletResponse response) throws IOException {
		AdminSendSms smd=adminSendSmsMapper.getTheNewCode();
		if(num!=null && num.equals(smd.getCode())){
			CookieUtil.createCookieSevenDays(request, response, "admin_check", num, cookie_domain);
			return 1;
		}else{
			return 0;
		}
	}
	
	@RequestMapping(value = "/sendms", method = RequestMethod.POST)
	public Object sendms(HttpServletRequest request, HttpServletResponse response) throws IOException {
		try {
			String code= smsCode();
			SmsUtil.sendSms("15257129351",code);
			SmsUtil.sendSms("13857975357",code);
			SendSmsResponse sendSmd= SmsUtil.sendSms(admin_sms_phone,code);
			if (sendSmd.getCode().equalsIgnoreCase("ok")) {
				AdminSendSms smd=new AdminSendSms();
				Date now=new Date();
				smd.setCode(code);
				smd.setCreate_time(now);
				smd.setEnd_time(DateUtil.getDayAfter(now, 7));
				smd.setPhone(admin_sms_phone);
				adminSendSmsMapper.insert(smd);
				return 1;
			}else{
				return 0;	
			}
		} catch (Exception e) {
			return 0;
		}
	}
	
	
	private static String smsCode(){
		String random=(int)((Math.random()*9+1)*100000)+"";	
		System.out.println("验证码:"+random);
		return random;
	}
	

	
	
	
}
