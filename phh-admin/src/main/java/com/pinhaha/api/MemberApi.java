package com.pinhaha.api;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pinhaha.enums.EnumMemberOrderType;
import com.pinhaha.enums.EnumMemberType;
import com.pinhaha.enums.EnumOrdeReturnType;
import com.pinhaha.mapper.AppSoldierApplyMapper;
import com.pinhaha.mapper.AppUserMapper;
import com.pinhaha.mapper.AppUserOrderAudingMapper;
import com.pinhaha.mapper.MemberLevelMapper;
import com.pinhaha.mapper.MemberOrderMapper;
import com.pinhaha.mapper.MemberUserMapper;
import com.pinhaha.pojo.AppSoldierApply;
import com.pinhaha.pojo.AppUser;
import com.pinhaha.pojo.AppUserOrderAuding;
import com.pinhaha.pojo.MemberLevel;
import com.pinhaha.pojo.MemberOrder;
import com.pinhaha.service.ManagerService;
import com.pinhaha.util.DateUtil;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("MemberApi")
@Slf4j
public class MemberApi extends BaseController {

	@Autowired
	private MemberLevelMapper memberLevelMapper;

	@Autowired
	private MemberUserMapper memberUserMapper;

	@Autowired
	private AppUserMapper appUserMapper;

	@Autowired
	private MemberOrderMapper memberOrderMapper;

	@Autowired
	private AppUserOrderAudingMapper appUserOrderAudingMapper;

	@Autowired
	private AppSoldierApplyMapper appSoldierApplyMapper;

	@Autowired
	private ManagerService managerService;

	@RequestMapping("provinceMemberUserList")
	public Map<String, Object> getMemberUserList(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		Map<String, Object> json = new ConcurrentHashMap<String, Object>();
		Integer page = Integer.parseInt(map.get("page").toString());
		Integer limit = Integer.parseInt(map.get("limit").toString());
		map.put("page", (page - 1) * limit);
		map.put("limit", limit);

		json.put("code", 0);
		json.put("msg", "");
		json.put("count", memberUserMapper.member_user_all_count(map));
		json.put("data", memberUserMapper.member_user_all(map));
		json.put("can_add_province", memberUserMapper.can_add_province());
		return json;
	}

	@RequestMapping("up_province")
	public Integer up_province(@RequestParam Map<String, Object> map) {
		return memberUserMapper.up_province(map);
	}

	@RequestMapping("cityMemberUserList")
	public Map<String, Object> cityMemberUserList(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		Map<String, Object> json = new ConcurrentHashMap<String, Object>();
		Integer page = Integer.parseInt(map.get("page").toString());
		Integer limit = Integer.parseInt(map.get("limit").toString());
		map.put("page", (page - 1) * limit);
		map.put("limit", limit);

		List<Map<String, Object>> city = memberUserMapper.can_add_city();

		Map<Object, List<Map<String, Object>>> grouby = city.stream().collect(Collectors.groupingBy(c -> c.get("province_id")));
		Map<String, Object> province = new ConcurrentHashMap<String, Object>();
		grouby.forEach((k, v) -> {
			province.put(k.toString(), v.get(0).get("province_name"));
		});
		json.put("code", 0);
		json.put("msg", "");
		json.put("count", memberUserMapper.member_user_all_count(map));
		json.put("data", memberUserMapper.member_user_all(map));
		json.put("can_add_city", grouby);
		json.put("can_add_province", province);
		return json;
	}

	@RequestMapping("getMemberByType")
	public Map<String, Object> getMemberByType(@RequestParam("type") Integer type, @RequestParam("page") Integer page, @RequestParam("limit") Integer limit, @RequestParam("phone") String phone, @RequestParam("userName") String userName) {

		PageHelper.startPage(page, limit);
		List<Map<String, Object>> list = appUserMapper.getMemberListByMemberType(EnumMemberType.partnerMember.getType(), phone, userName);

		PageInfo<Map<String, Object>> pageResult = new PageInfo<>(list);

		return this.getPageJson(0, "", pageResult.getTotal(), pageResult.getList());
	}

	@RequestMapping("addPratner")
	@Transactional
	public Map<String, Object> addPratner(@RequestParam("phone") String phone) {
		try {
			AppUser user = appUserMapper.selectByPhone(phone);
			if (user == null) {
				return this.setJson(false, "该手机号未找到用户!!", null);
			}

			synchronized (user.getId()) {
				MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(5L);

				if (user.getMember_level_id() != null) {
					if (user.getMember_level_id().longValue() >= memberLevel.getId().longValue()) {
						return this.setJson(false, "该用户已是更高等级的会员!!", null);
					}
				} else {
					log.info("游客升级股东操作");
				}

				if (memberOrderMapper.countMemberOrder(user.getId(), memberLevel.getId()) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请一次权限,请勿重复提交!!", null);
				}
				Date now = new Date();
				String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
				MemberOrder order = new MemberOrder();
				order.setCreate_time(now);
				order.setIs_closed(false);
				order.setIs_pay(true);
				order.setUser_id(user.getId());
				order.setMember_id(memberLevel.getId());
				order.setOrder_no(orderNo);
				order.setOrder_price(memberLevel.getMember_price());
				order.setOrder_type(5);
				order.setPay_time(now);
				order.setReduction_price(new BigDecimal(0));
				order.setReturn_type(1);// 未结算
				order.setOver_time(DateUtil.getDayAfter(now, 30));
				memberOrderMapper.insert(order);

				// 添加信息到审核表
				AppUserOrderAuding auding = new AppUserOrderAuding();

				auding.setAdmin_user_id(1L);
				// 1.待审核 2.后台审核发放 3.上级已拆分 4.系统发放
				auding.setAuding_type(2);
				auding.setCreate_time(now);
				auding.setOrder_no(orderNo);
				auding.setUser_id(user.getId());
				if (user.getInvitation_user_id() != null) {
					auding.setInvite_id(user.getInvitation_user_id());
				}
				appUserOrderAudingMapper.insert(auding);

				return this.setJson(true, "添加成功", null);
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return this.setJson(false, "添加失败", null);
		}

	}

	@RequestMapping("addProvince")
	@Transactional
	public Map<String, Object> addProvince(@RequestParam Map<String, Object> map) {
		try {
			String phone = map.get("phone").toString();
			AppUser user = appUserMapper.selectByPhone(phone);
			if (user == null) {
				return this.setJson(false, "该手机号未找到用户!!", null);
			}

			if (user.getMember_level_id() != null && user.getMember_level_id().intValue() >= 7) {
				return this.setJson(false, "该用户已经有权限,请勿重复提交!!", null);
			}

			map.put("user_id", user.getId());

			synchronized (user.getId()) {
				memberUserMapper.add_app_area_agent(map);
				MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(7L);

				if (memberOrderMapper.countMemberOrder(user.getId(), memberLevel.getId()) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请一次权限,请勿重复提交!!", null);
				}

				Date now = new Date();
				String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
				MemberOrder order = new MemberOrder();
				order.setCreate_time(now);
				order.setIs_closed(false);
				order.setIs_pay(true);
				order.setUser_id(user.getId());
				order.setMember_id(memberLevel.getId());
				order.setOrder_no(orderNo);
				order.setOrder_price(memberLevel.getMember_price());
				order.setPay_time(now);
				order.setReduction_price(new BigDecimal(0));
				order.setReturn_type(1);// 未结算
				order.setOver_time(DateUtil.getDayAfter(now, 30));
				// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
				order.setOrder_type(EnumMemberOrderType.SYSTEMAUDING.getType());
				memberOrderMapper.insert(order);

				// 添加信息到审核表
				AppUserOrderAuding auding = new AppUserOrderAuding();

				auding.setAdmin_user_id(1L);
				// 1.待审核 2.后台审核发放 3.上级已拆分 4.系统发放
				auding.setAuding_type(2);
				auding.setCreate_time(now);
				auding.setOrder_no(orderNo);
				auding.setUser_id(user.getId());
				if (user.getInvitation_user_id() != null) {
					auding.setInvite_id(user.getInvitation_user_id());
				}
				appUserOrderAudingMapper.insert(auding);
				return this.setJson(true, "添加成功", null);
			}

		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return this.setJson(false, "添加失败", null);
		}
	}

	@RequestMapping("addCity")
	@Transactional
	public Map<String, Object> addCity(@RequestParam Map<String, Object> map) {
		try {
			String phone = map.get("phone").toString();
			AppUser user = appUserMapper.selectByPhone(phone);
			if (user == null) {
				return this.setJson(false, "该手机号未找到用户!!", null);
			}

			if (user.getMember_level_id() != null && user.getMember_level_id().intValue() >= 6) {
				return this.setJson(false, "该用户已经有权限,请勿重复提交!!", null);
			}

			map.put("user_id", user.getId());

			synchronized (user.getId()) {
				memberUserMapper.add_app_area_agent(map);
				MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(6L);

				if (memberOrderMapper.countMemberOrder(user.getId(), memberLevel.getId()) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请一次权限,请勿重复提交!!", null);
				}
				Date now = new Date();
				String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
				MemberOrder order = new MemberOrder();
				order.setCreate_time(now);
				order.setIs_closed(false);
				order.setIs_pay(true);
				order.setUser_id(user.getId());
				order.setMember_id(memberLevel.getId());
				order.setOrder_no(orderNo);
				order.setOrder_price(memberLevel.getMember_price());
				order.setPay_time(now);
				order.setReduction_price(new BigDecimal(0));
				order.setReturn_type(1);// 未结算
				order.setOver_time(DateUtil.getDayAfter(now, 30));
				// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
				order.setOrder_type(EnumMemberOrderType.SYSTEMAUDING.getType());
				memberOrderMapper.insert(order);

				// 添加信息到审核表
				AppUserOrderAuding auding = new AppUserOrderAuding();

				auding.setAdmin_user_id(1L);
				// 1.待审核 2.后台审核发放 3.上级已拆分 4.系统发放
				auding.setAuding_type(2);
				auding.setCreate_time(now);
				auding.setOrder_no(orderNo);
				auding.setUser_id(user.getId());
				if (user.getInvitation_user_id() != null) {
					auding.setInvite_id(user.getInvitation_user_id());
				}
				appUserOrderAudingMapper.insert(auding);

				return this.setJson(true, "添加成功", null);
			}

		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return this.setJson(false, "添加失败", null);
		}
	}

	/**
	 * 学习码审核表
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("user_order_auding_list")
	public Map<String, Object> user_order_auding_list(@RequestParam Map<String, Object> map) {
		Integer page = Integer.parseInt(map.get("page").toString());
		Integer limit = Integer.parseInt(map.get("limit").toString());
		map.put("page", (page - 1) * limit);
		map.put("limit", limit);
		Map<String, Object> json = new ConcurrentHashMap<String, Object>();
		json.put("code", 0);
		json.put("msg", "");
		json.put("count", appUserOrderAudingMapper.user_order_auding_list_size());
		json.put("data", appUserOrderAudingMapper.user_order_auding_list(map));
		return json;
	}

	@RequestMapping("allow")
	public synchronized int allow(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		appUserOrderAudingMapper.up_user_order_auding(map);
		MemberOrder record = memberOrderMapper.selectByOrderNo(map.get("order_no").toString());
		record.setIs_pay(true);
		record.setOrder_type(EnumMemberOrderType.SYSTEMAUDING.getType());
		record.setReturn_type(EnumOrdeReturnType.unReturn.getType());
		record.setPay_time(new Date());
		int state = memberOrderMapper.updateByPrimaryKey(record);
		return state;
	}

	/**
	 * 添加普通会员
	 * 
	 * @return
	 */
	@RequestMapping("add_lev1")
	@Transactional
	public Map<String, Object> add_lev1(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		AppUser user = appUserMapper.selectByPhone(map.get("phone").toString());
		Long Invite = null;
		if (user == null) {
			return this.setJson(false, "该手机号未查到用户", null);
		}

		Long levelId = Long.valueOf(map.get("levelId").toString());
		if (levelId == null || levelId.intValue() > 4 || levelId.intValue() < 1) {
			return this.setJson(false, "请选择正确的会员开通等级!!!", null);
		}
		if (user.getMember_level_id() != null) {
			if (user.getMember_level_id() == levelId) {
				return this.setJson(false, "添加失败,该用户已经开通过此等级会员", null);
			} else if (user.getMember_level_id().intValue() > levelId.intValue()) {
				return this.setJson(false, "添加失败,该用户会员等级大于此等级会员", null);
			}

		}
		if (!map.get("code").equals("")) {
			AppUser user1 = appUserMapper.selectByInviteCode(map.get("code").toString());
			if (user1 != null) {
				Invite = user1.getInvitation_user_id();
			} else {
				return this.setJson(false, "邀请码不存在", null);
			}
		}
		synchronized (user.getId()) {
			try {
				Date now = new Date();
				String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
				MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(levelId);
				if (memberOrderMapper.countMemberOrder(user.getId(), memberLevel.getId()) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请该会员一次,请勿重复提交!!", null);
				}

				// 添加信息到订单表
				MemberOrder order = new MemberOrder();
				// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
				order.setOrder_type(EnumMemberOrderType.SYSTEMAUDING.getType());
				// 订单号
				order.setOrder_no(orderNo);
				order.setCreate_time(now);
				// 用户是否关闭
				order.setIs_closed(false);
				// 是否支付成功
				order.setIs_pay(true);
				order.setUser_id(user.getId());
				// 会员id
				order.setMember_id(memberLevel.getId());
				// 订单金额
				order.setOrder_price(memberLevel.getMember_price());
				order.setPay_time(now);
				// 优惠金额
				order.setReduction_price(new BigDecimal(0));
				// 0.待审核 1.未计算 2.计算中 3.结算完毕
				order.setReturn_type(EnumOrdeReturnType.unReturn.getType());
				order.setOver_time(DateUtil.getDayAfter(now, 30));
				memberOrderMapper.insert(order);
				// 添加信息到审核表
				AppUserOrderAuding auding = new AppUserOrderAuding();

				auding.setAdmin_user_id(1L);
				// 1.待审核 2.后台审核发放 3.上级已拆分 4.系统发放
				auding.setAuding_type(2);
				auding.setCreate_time(now);
				auding.setOrder_no(orderNo);
				auding.setUser_id(user.getId());
				auding.setInvite_id(user.getInvitation_user_id());
				appUserOrderAudingMapper.insert(auding);
				return this.setJson(true, "添加成功", null);
			} catch (Exception e) {
				// TODO: handle exception
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return this.setJson(false, "添加失败", null);
			}
		}
	}

	/**
	 * 添加普通会员
	 * 
	 * @return
	 */
	@RequestMapping("add_lev1_for_soldier")
	@Transactional
	public Map<String, Object> add_lev1_for_soldier(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		Integer user_id = Integer.parseInt(map.get("user_id").toString());
		Integer soldier_id = Integer.parseInt(map.get("id").toString());

		AppUser user = appUserMapper.selectByPrimaryKey(user_id);
		Long Invite = null;

		if (user == null) {
			return this.setJson(false, "未查到用户", null);
		}

		if (user.getMember_level_id() != null) {
			AppSoldierApply asa = appSoldierApplyMapper.selectByPrimaryKey(soldier_id);
			asa.setApply_type(3);
			appSoldierApplyMapper.updateByPrimaryKey(asa);
			return this.setJson(false, "添加失败,该用户已经是会员", null);
		}

		if (user.getInvitation_user_id() != null) {
			Invite = user.getInvitation_user_id();
		}

		synchronized (user.getId()) {
			try {
				Date now = new Date();
				String orderNo = "T" + DateUtil.getDateTimeOrderFormat(now) + user.getId();
				MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(1L);
				if (memberOrderMapper.countMemberOrder(user.getId(), memberLevel.getId()) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请该会员一次,请勿重复提交!!", null);
				}

				// 添加信息到订单表
				MemberOrder order = new MemberOrder();
				// 1.支付宝，2.微信，3.上级拆分，4.下级申请 5.系统审核订单
				order.setOrder_type(EnumMemberOrderType.SYSTEMAUDING.getType());
				// 订单号
				order.setOrder_no(orderNo);
				order.setCreate_time(now);
				// 用户是否关闭
				order.setIs_closed(false);
				// 是否支付成功
				order.setIs_pay(true);
				order.setUser_id(user.getId());
				// 会员id
				order.setMember_id(memberLevel.getId());
				// 订单金额
				order.setOrder_price(memberLevel.getMember_price());
				order.setPay_time(now);
				// 优惠金额
				order.setReduction_price(new BigDecimal(0));
				// 0.待审核 1.未计算 2.计算中 3.结算完毕
				order.setReturn_type(EnumOrdeReturnType.unReturn.getType());
				order.setOver_time(DateUtil.getDayAfter(now, 30));
				memberOrderMapper.insert(order);
				// 添加信息到审核表
				AppUserOrderAuding auding = new AppUserOrderAuding();

				auding.setAdmin_user_id(1L);
				// 1.待审核 2.后台审核发放 3.上级已拆分 4.系统发放
				auding.setAuding_type(2);
				auding.setCreate_time(now);
				auding.setOrder_no(orderNo);
				auding.setUser_id(user.getId());
				if (Invite != null) {
					auding.setInvite_id(Invite);
				}
				appUserOrderAudingMapper.insert(auding);
				AppSoldierApply asa = appSoldierApplyMapper.selectByPrimaryKey(soldier_id);
				asa.setApply_type(2);
				appSoldierApplyMapper.updateByPrimaryKey(asa);
				return this.setJson(true, "添加成功", null);
			} catch (Exception e) {
				// TODO: handle exception
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return this.setJson(false, "添加失败", null);
			}
		}
	}

	/**
	 * 添加普通会员
	 * 
	 * @return
	 */
	@RequestMapping("chaifenVip")
	@Transactional
	public Map<String, Object> chaifenVip(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		AppUser user = appUserMapper.selectByPhone(map.get("twophone").toString());
		if (user == null) {
			return this.setJson(false, "下级手机号未查到用户", null);
		}
		if (user.getMember_level_id() != null) {
			return this.setJson(false, "下级用户已经拥有会员权限", null);
		}
		AppUser inviteUser = appUserMapper.selectByPhone(map.get("onephone").toString());
		if (inviteUser == null) {
			return this.setJson(false, "上级手机号未查到用户", null);
		}
		if (user.getInvitation_user_id().longValue() != inviteUser.getId()) {
			return this.setJson(false, "用户上下级不匹配!!!", null);
		}
		if (inviteUser.getMember_level_id().intValue() <= 1) {
			return this.setJson(false, "上级用户未拥有拆分权限", null);
		}

		synchronized (user.getId()) {
			try {
				if (memberOrderMapper.countMemberOrderUserBuy(user.getId(), Long.valueOf(map.get("levelId").toString())) > 0) {
					return this.setJson(false, "一个用户当天后台只能申请该会员一次,请勿重复提交!!", null);
				}

				if (!managerService.chaifenMember(user, map.get("levelId").toString())) {
					return this.setJson(false, "拆分失败", null);
				}
				// 添加信息到审核表
				return this.setJson(true, "拆分成功", null);
			} catch (Exception e) {
				// TODO: handle exception
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				return this.setJson(false, "拆分失败", null);
			}
		}
	}

	/**
	 * 现场公开课
	 * 
	 * @return
	 */
	@RequestMapping("fieldClassVip")
	public Map<String, Object> fieldClassVip(@RequestParam Map<String, Object> map) {
		log.info(map.toString());
		AppUser user = appUserMapper.selectByPhone(map.get("twophone").toString());
		if (user == null) {
			return this.setJson(false, "下级手机号未查到用户", null);
		}
		 if(user.getMember_level_id()!=null){
		 return this.setJson(false, "下级用户已经拥有会员权限", null);
		 }
		AppUser inviteUser = appUserMapper.selectByPhone(map.get("onephone").toString());
		if (inviteUser == null) {
			return this.setJson(false, "上级手机号未查到用户", null);
		}
		if (user.getInvitation_user_id().longValue() != inviteUser.getId()) {
			return this.setJson(false, "用户上下级不匹配!!!", null);
		}
		if (inviteUser.getMember_level_id() == null || inviteUser.getMember_level_end_time().before(new Date())) {
			return this.setJson(false, "上级用户未拥有该权限", null);
		}

		try {

			MemberLevel memberLevel = memberLevelMapper.selectByPrimaryKey(Long.valueOf(map.get("levelId").toString()));
			if (memberOrderMapper.countMemberOrderUserBuy(user.getId(), memberLevel.getId()) > 0) {
				return this.setJson(false, "一个用户当天后台只能申请该会员一次,请勿重复提交!!", null);
			}
			
			
			if (!managerService.fieldClassMember(user, map.get("levelId").toString())) {
				return this.setJson(false, "拆分失败", null);
			}

			return this.setJson(true, "拆分成功", null);
		} catch (Exception e) {
			return this.setJson(false, "拆分失败", null);
		}
	}
}
