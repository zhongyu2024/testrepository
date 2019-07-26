<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'yybb.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="/ZhongyuSystem/css/lxd/yewubaobiao.css" type="text/css" />
	<script type="text/javascript" src="/ZhongyuSystem/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="/ZhongyuSystem/laydate/laydate.js"></script>	
  </head>
  
  <body>
		<div id="head">
			<div id="headL">aja<img src="/ZhongyuSystem/images/lxd/head1.jpg"></div>
		</div>
		<hr color="#CCCCCC" width="1440" />
		<div id="title">			
			<div class="titleBt" id="titleBt1"><a href="#fl1"><img src="/ZhongyuSystem/images/lxd/yingyegaikuang.jpg"></a></div>
			<div class="titleBt" id="titleBt2"><a href="#fl2"><img src="/ZhongyuSystem/images/lxd/shouyinbaobiao.jpg"></a></div>
			<div class="titleBt" id="titleBt3"><a href="#fl3"><img src="/ZhongyuSystem/images/lxd/yingyefenxi.jpg"></a></div>
			<div class="titleBt" id="titleBt4"><a href="#fl4"><img src="/ZhongyuSystem/images/lxd/huiyuanfenxi.jpg"></a></div>
		</div>
		<hr color="#CCCCCC" width="1440" />
		<!--营业概况界面-->
		<div class="T" id="fl1">
			<div style="margin-left: 120px;width: 1440px;height: 65px;">
			     
				<div>
					<div class="fltime">开始时间<input type="text" id="test1"></div>
					<div class="fltime">结束时间<input type="text" id="test2"></div>
					<div class="fltime"><input class="lxdsearch" type="submit" value="查询"></div>
				</div>
				 
			</div>
			<hr color="#CCCCCC" width="1440" />
			<div class="rdbo">

			</div>
		</div>
		<!--收银报表界面-->
		<div class="T" id="fl2">
			<div class="lts">
				<div class="ltsBl"><a href="#ltT1_1">营业综合统计报表</a></div>
				<div class="ltsBl"><a href="#ltT1_2">营业额日统计报表</a></div>
				<div class="ltsBl"><a href="#ltT1_3">营业收款统计报表</a></div>
				<div class="ltsBl"><a href="#ltT1_4">菜品销售统计报表</a></div>
			</div>
			<!--营业综合统计报表-->
			<div class="rdbo" id="ltT1_1">
			     
				<div style="width: 1230px;height: 85px;float: left;">				    
					<div class="fltime">开始时间<input type="text" id="test3"></div>
					<div class="fltime">结束时间<input type="text" id="test4"></div>
					<div class="fltime">用餐时段
						<select name="" >
							<option value="0">select all</option>
							<option value="1">早市</option>
							<option value="2">午市</option>
							<option value="3">晚市</option>
						</select>
					</div>
					<div class="fltime"><input class="chaxunxd" type="button" value="查询"></div>
					<!-- <div class="fltime"><input type="checkbox">显示退单</div>	 -->				
				</div>
			     
			</div>
			<div  id="ajax">
			 
			  <table style="border:1px solid  black; "  >
			    <tr>
			       <td colspan="2" align="center">营业综合统计报表</td>
			    </tr>
			    <tr>
			     <td  align="left">
			     <div> 开始时间</div>
			     <div>结束时间  </div>
			     </td>
			     <td  align="right">
			      <div>时间不限</div>
			       <div>时间不限</div>
			     </td>
			     </tr> 
			    <tr>
			     <td align="left">折扣</td>
			     <td align="right">${listAl.discount}</td>
			    </tr>
			    <tr>
			    <td align="left">营业总额（实付）</td>
			    <td align="right">${listAl.realcount}</td>
			    </tr>
			    <tr>
			    <td align="left">总单数</td>
			    <td align="right">${listAl.danshu}</td>
			    </tr>
			    <tr>
			    <td align="left">消费人数</td>
			    <td align="right">${listAl.personcount}</td>
			    </tr> 
			  </table>
			 
			
			</div>
			 
			
			<!--营业额日统计报表-->
			<div class="rdbo" id="ltT1_2">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test5"></div>
					<div class="fltime">结束时间<input type="text" id="test6"></div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>				
				</form>
			</div>
			<!--营业收款统计报表-->
			<div class="rdbo" id="ltT1_3">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test7"></div>
					<div class="fltime">结束时间<input type="text" id="test8"></div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>				
				</form>
			</div>
			<!--菜品销售统计报表-->
			<div class="rdbo" id="ltT1_4">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test9"></div>
					<div class="fltime">结束时间<input type="text" id="test10"></div>
					<div class="fltime">所属菜类
						<select>
							<option value="0">select all</option>
							<option value="1">01-精致冷碟</option>
							<option value="2">02-精选热菜</option>
							<option value="3">03-特色小炒</option>
							<option value="4">04-川府菜肴</option>
							<option value="5">05-精-品点心</option>
							<option value="6">06-酒水饮料</option>
						</select>
					</div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>
				</form>
			</div>
		</div>
		<!--营业分析界面-->
		<div class="T" id="fl3">		    
			<div class="lts">
				<div class="ltsBl"><a href="#ltT2_1">菜品分析</a></div>
				<div class="ltsBl"><a href="#ltT2_3">退菜报表</a></div>
				<div class="ltsBl"><a href="#ltT2_4">支付明细报表</a></div>
				<div class="ltsBl"><a href="#ltT2_5">餐台统计报表</a></div>
				<div class="ltsBl"><a href="#ltT2_6">免单明细报表</a></div>
			</div>
			<!--菜品分析-->
			<div class="rdbo" id="ltT2_1">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test11"></div>
					<div class="fltime">结束时间<input type="text" id="test12"></div>
					<div class="fltime">用餐时段
						<select name="">
							<option value="0">select all</option>
							<option value="1">早市</option>
							<option value="2">午市</option>
							<option value="3">晚市</option>
						</select>
					</div>
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						菜品分析界面
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>菜品名称</td>								
								<td>菜品类别</td>	
								<td>点单数量</td>
								<td>退菜数量</td>
								<td>折前金额</td>
								<td>折后金额</td>					
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--退菜报表-->
			<div class="rdbo" id="ltT2_3">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test15"></div>
					<div class="fltime">结束时间<input type="text" id="test16"></div>
					<div class="fltime">退菜理由
						<select>
							<option value="0">全部理由</option>
							<option value="1">顾客点错</option>
							<option value="2">质量原因</option>
						</select>
					</div>
					<div class="fltime">所属菜类
						<select>
							<option value="0">select all</option>
							<option value="1">01-精致冷碟</option>
							<option value="2">02-精选热菜</option>
							<option value="3">03-特色小炒</option>
							<option value="4">04-川府菜肴</option>
							<option value="5">05-精品点心</option>
							<option value="6">06-酒水饮料</option>
						</select>
					</div>
					<div class="fltime"><input type="checkbox">按退菜理由汇总</div>
					<div class="fltime"><input type="checkbox">按菜品汇总</div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						退菜报表
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>订单号</td>
								<td>菜品名称</td>
								<td>数量</td>
								<td>金额</td>
								<td>理由</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--支付明细报表-->
			<div class="rdbo" id="ltT2_4">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test17"></div>
					<div class="fltime">结束时间<input type="text" id="test18"></div>
					<div class="fltime"><input type="text">订单号</div>
					<div class="fltime"><input type="checkbox">显示明细</div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>

				<div class="showXm">
					<div class="formhead">
						支付明细报表
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>订单号</td>
								<td>支付金额</td>
								<td>结账时间</td>
								<td>账期时间</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--餐台统计报表-->
			<div class="rdbo" id="ltT2_5">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test19"></div>
					<div class="fltime">结束时间<input type="text" id="test20"></div>
					<div class="fltime">所属区域
						<select>
							<option value="0">select all</option>
							<option value="1">001-大厅</option>
							<option value="2">002-包厢 </option>
						</select>
					</div>
					<div class="fltime">餐台名称
						<select>
							<option value="0">select all</option>
							<option value="1">1号桌</option>
							<option value="2">2号桌</option>
							<option value="3">3号桌</option>
							<option value="4">4号桌</option>
							<option value="5">5号桌</option>
							<option value="6">6号桌</option>
							<option value="7">7号桌</option>
							<option value="8">8号桌</option>
							<option value="9">9号桌</option>
							<option value="10">10号桌</option>
						</select>
					</div>
					<div class="fltime">
						<select>
							<option value="0">select all</option>
							<option value="1">1包厢</option>
							<option value="2">2包厢</option>
							<option value="3">3包厢</option>
							<option value="4">4包厢</option>
							<option value="5">5包厢</option>
							<option value="6">6包厢</option>
						</select>
					</div>
					<div class="fltime"><input type="submit" value="查询"></div>
					<div class="showXm">
						<div class="formhead">
							餐台统计表
						</div>
						<div class="formtitle">
							<table>
								<tr>
									<td>区域</td>
									<td>餐台名称</td>
									<td>消费人数</td>
									<td>消费金额</td>
									<td>人均消费</td>
									<td>翻台次数</td>
									<td>翻台率</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!--免单明细报表-->
			<div class="rdbo" id="ltT2_6">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test21"></div>
					<div class="fltime">结束时间<input type="text" id="test22"></div>
					<div class="fltime">发生餐台
						<select>
							<option value="0">select all</option>
							<option value="1">1号桌</option>
							<option value="2">2号桌</option>
							<option value="3">3号桌</option>
							<option value="4">4号桌</option>
							<option value="5">5号桌</option>
							<option value="6">6号桌</option>
							<option value="7">7号桌</option>
							<option value="8">8号桌</option>
							<option value="9">9号桌</option>
							<option value="10">10号桌</option>
							<option value="11">1包厢</option>
							<option value="12">2包厢</option>
							<option value="13">3包厢</option>
							<option value="14">4包厢</option>
							<option value="15">5包厢</option>
							<option value="16">6包厢</option>
						</select>
					</div>
					<div class="fltime">操作员
						<select>
							<option value="0">select all</option>
							<option value="1">陈</option>
							<option value="2">王</option>
						</select>
					</div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>
				<div class="showXm">
					<div class="formhead">
						免单明细表
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>订单号</td>
								<td>订单金额</td>
								<td>免单时间</td>
								<td>操作员</td>
								<td>备注</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!--会员分析界面-->
		<div class="T" id="fl4">
			<div class="lts">
				<div class="ltsBl"><a href="#ltT3_1">会员充值消费统计报表</a></div>
				<div class="ltsBl"><a href="#ltT3_2">会员卡充值消费明细报表</a></div>
			</div>
			<!--会员充值消费统计报表-->
			<div class="rdbo" id="ltT3_1">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test23"></div>
					<div class="fltime">结束时间<input type="text" id="test24"></div>
					<div class="fltime">会员名/卡号<input type="text"></div>
					<div class="fltime">会员卡类型
						<select>
							<option value="0">全部会员类型</option>
							<option value="1">普卡会员</option>
							<option value="2">银卡会员</option>
							<option value="3">金卡会员</option>
						</select>
					</div>
					<div class="fltime"><input type="checkbox">仅显示有充值消费记录的会员卡</div>
					<div class="fltime"><input type="submit" value="查询"></div>
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						会员充值消费统计报表
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>姓名</td>
								<td>会员类型</td>
								<td>卡号</td>
								<td>消费单数</td>
								<td>消费金额</td>
								<td>充值金额</td>
								<td>会员余额</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--会员卡充值消费明细报表-->
			<div class="rdbo" id="ltT3_2">
			    <form action="" method="post">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test25"></div>
					<div class="fltime">结束时间<input type="text" id="test26"></div>
					<div class="fltime">操作员
						<select>
							<option value="0">select all</option>
							<option value="1">陈</option>
							<option value="2">王</option>
						</select>
					</div>
					<div class="fltime">会员卡类型
						<select name="">
							<option value="0">全部会员类型</option>
							<option value="1">普卡会员</option>
							<option value="2">银卡会员</option>
							<option value="3">金卡会员</option>
						</select>
					</div>
					<div class="fltime"><input type="checkbox">充值</div>
					<div class="fltime"><input type="checkbox">消费</div>
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						会员卡充值消费明细报表
					</div>
					<div class="formtitle">
						<table>
							<tr>
								<td>会员名</td>
								<td>会员类型</td>
								<td>卡号</td>
								<td>金额</td>
								<td>类型</td>
								<td>余额</td>
								<td>时间</td>
								<td>操作员</td>
								<td>订单号</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</body>


</html>
<script>
	laydate.render({
		elem: '#test1',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test2',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test3',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test4',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test5',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test6',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test7',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test8',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test9',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test10',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test11',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test12',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test13',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test14',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test15',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test16',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test17',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test18',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test19',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test20',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test21',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test22',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test23',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test24',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test25',
		type: 'datetime'
	});
	laydate.render({
		elem: '#test26',
		type: 'datetime'
	});
</script>
<script>
	$(document).ready(function(){
		//初始状态
		$(".T").hide();//隐藏所有.T标签
		$(".titleBt:first").addClass("active").show();
		$(".T:first").show();
	})	
	//点击事件
	$(".titleBt").click(function(){
		$(".titleBt").removeClass("active");
		$(this).addClass("active");
		$(".T").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn(); 
        return false; 
	})
</script>
<script>
	$(document).ready(function(){
		//初始状态
		$(".rdbo").hide();//隐藏所有.T标签
		$(".ltsBl:first").addClass("active").show();
		$(".rdbo:first").show();
	})	
	//点击事件
	$(".ltsBl").click(function(){
		$(".ltsBl").removeClass("active");
		$(this).addClass("active");
		$(".rdbo").hide();
		var activeTab = $(this).find("a").attr("href");
		$(activeTab).fadeIn(); 
        return false; 
	})
	
	$(".chaxunxd").click(function(){
	 
	alert($("#test3").val());
	alert($("#test4").val());
	if($("#test3").val().length==0&&($("#test4").val()!=0)||($("#test3").val().length!=0&&($("#test4").val()==0)))
	{
	 alert("请明确时间"); 
	}
	else{
	
	 
	 $.ajax({
  			       url:"detail/xdtiaojian.do",
  			       dataType:"html",
  			       data:{"time1":$("#test3").val(),"time2":$("#test4").val()},
  			        success:function(result){
  				     $("#ajax").html(result);
  			        }, 
  		        });  
  		        }
	})
	
	
</script>