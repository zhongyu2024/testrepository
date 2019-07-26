<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

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
			<div id="headL"><img src="/ZhongyuSystem/images/lxd/head1.jpg"></div>
		</div>
		<hr color="#CCCCCC" width="1440" />
		<div id="title">			
			<div class="titleBt" id="titleBt1"><a href="#fl1"><img src="/ZhongyuSystem/images/lxd/yingyegaikuang.jpg"></a></div>
			<div class="titleBt" id="titleBt2"><a href="#fl2"><img src="/ZhongyuSystem/images/lxd/shouyinbaobiao.jpg"></a></div>
			<div class="titleBt" id="titleBt3"><a href="#fl3"><img src="/ZhongyuSystem/images/lxd/yingyefenxi.jpg"></a></div>
			<div class="titleBt" id="titleBt4"><a href="#fl4"><img src="/ZhongyuSystem/images/lxd/huiyuanfenxi.jpg"></a></div>
		</div>
		<hr color="#E9EDF1" width="1440" />
		<!--营业概况界面-->
		<div class="T" id="fl1">
		<div id="showView">
		<table style="width:100%">
			<tr style="width:100%;height:50px;border-bottom:1px solid #F5F5F5;">
				<!-- 报表头部 -->
				<td colspan="2" style="border-bottom:1px solid #F5F5F5;background:#354148;color:white;border-radius:5px;padding-left: 20px; ">
					<span style="float:left;font-weight:bold;">营业收入:￥${total}</span>
					<span style="float:left;margin-left:20px;">总订单数:${sum }</span>
					<span style="float:left;margin-left:10px;">总消费人数:${hum }</span>
					<span style="float:left;margin-left:10px;">人均消费:￥${renjun }</span>
					<span style="float:left;margin-left:10px;">客单价:￥${kedan}</span>
				</td>
			</tr>
			<tr style="height:180px;">
				<td width="50%">
					<table cellspacing="50%" style="border-collapse:collapse;width:50%;border-top:1px solid #F5F5F5;border-right:1px solid #DADADA;border-bottom:1px solid #DADADA;background: #BFBFBE;color:white;border-radius:5px;margin-left:10px; ">
						<tr style="float:left;border-bottom:1px solid #F5F5F5;">
							<td colspan="4" style="height:30px;">销售汇总</td>
						</tr>
						<tr style="height:30px;border-bottom:1px dashed #F5F5F5;">
							<td colspan="4" style="float:left;width:515px;">菜类</td>  
						</tr>
<%-- 						<c:forEach items="${clist}" var="cooktype">
 --%>					<tr style="height:30px;">
							<td style="width:515px;float:left;">精致冷碟</td>
							<td colspan="3"></td>
							<td>${a1 }</td>
						</tr>
<%-- 						</c:forEach>
 --%>					
 						<tr style="height:30px;">
							<td style="width:515px;float:left;">精致热菜</td>
							<td colspan="3"></td>
							<td>${a2}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">特色小炒</td>
							<td colspan="3"></td>
							<td>${a3}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">川府菜肴</td>
							<td colspan="3"></td>
							<td>${a4}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">精品点心</td>
							<td colspan="3"></td>
							<td>${a5}</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:515px;float:left;">酒水饮料</td>
							<td colspan="3"></td>
							<td>${a6}</td>
						</tr>
 						<tr style="height:30px;border-bottom:1px dashed #F5F5F5;">
								<td style="width:150px;float:left;">小计:</td>
								<td colspan="3"></td>
								<td>￥${total}</td>						
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">免单金额:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">服务费:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">抹零:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">手动优惠:</td>
							<td colspan="3"></td>
							<td>-0.00</td>
						</tr>
						<tr style="height:30px;">
							<td style="width:150px;float:left;">总额:</td>
							<td colspan="3"></td>
							<td>￥${total}</td>
						</tr>
					</table>
				</td>
				<td>
					<table style="margin-left:-280px;height:340px;margin-bottom:90px;text-align:center;border-collapse:collapse;background: #BFBFBE;border-radius:6px;color:white;width:1000px;">
						<tr style="height:30px;float:left;border-bottom:1px solid #DADADA;">
							<td>支付汇总</td>
						</tr>
						<tr style="height:60px;border-bottom:1px dashed #DADADA;">
							<td style="width:200px;float:left;">支付方式</td> 
							<td style="width:130px;">单数</td> 
							<td style="width:130px;">实付</td> 
							<td style="width:130px;">实收</td>
						</tr>
						<tr style="height:60px;">
							<td>现金支付</td>
							<td>${sum }</td>
							<td>${total}</td>
							<td>${total}</td>
						</tr>
						<tr style="height:60px;border-top:1px solid #DADADA;border-bottom:1px dashed #DADADA;">
							<td>合计:</td>
							<td><br><br></td>
							<td>￥${total }</td>
							<td>￥${total }</td>
						</tr>
						<tr style="height:50px;float:left;">
							<td style="">会员充值</td>
						</tr>
						<tr style="height:100px;border-top:1px solid #DADADA;border-bottom:1px dashed #DADADA;">
							<td>合计:</td>
							<td colspan="2">&lt;</td>
							<td>￥${chongzhi }</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    </div>
    </div>
		<!--收银报表界面-->
		<div class="T" id="fl2">
			<div class="lts">
				<div class="ltsBl"><a href="#ltT1_1">营业综合统计报表</a></div>
				<!-- <div class="ltsBl"><a href="#ltT1_2">营业额日统计报表</a></div>
				<div class="ltsBl"><a href="#ltT1_3">营业收款统计报表</a></div>
				<div class="ltsBl"><a href="#ltT1_4">菜品销售统计报表</a></div> -->
			</div>
			<!--营业综合统计报表-->
			<div class="rdbo" id="ltT1_1">
			     
				<div style="width: 1230px;height: 85px;float: left;">				    
					<div class="fltime">开始时间<input type="text" id="test3"></div>
					<div class="fltime">结束时间<input type="text" id="test4"></div>
		
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
			 
			
		</div> 
		<!--营业分析界面-->
		<div class="T" id="fl3">		    
			<div class="lts">
				<div class="ltsBl" id="yyfx1"><a href="#ltT2_1">菜品分析</a></div>
				<div class="ltsBl" id="yyfx2"><a href="#ltT2_4">支付明细报表</a></div>
				<div class="ltsBl" id="yyfx3"><a href="#ltT2_5">餐台统计报表</a></div>
			</div>
			<!--菜品分析-->
			<div class="rdbo" id="ltT2_1">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test11"></div>
					<div class="fltime">结束时间<input type="text" id="test12"></div>
					<div class="fltime">所属菜类
						<select id="s3b1Sel">
							<option value="0">选择种类</option>
							<c:forEach items="${ck }" var="c1">
								<option value="${c1.id }">${c1.name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="fltime"><input type="button" value="查询" onclick="ajaxS3B1()"></div>
				</div>				
				<div class="showXm">
					<div class="formhead">
						菜品分析界面
					</div>
					<div class="formtitle" id="S3B1">
						<table border="1px" bordercolor="#EFEFEF" cellspacing="0px">
							<tr bgcolor="#E9EDF1">
								<td>菜品名称</td>								
								<td>菜品类别</td>	
								<td>点单数量</td>
								<td>实付金额</td>					
							</tr>
							<c:forEach items="${Listinfo}" var="lif">
							<tr>
								<td width="60">${cainame}</td>
								<td width="60">${caitype}</td>
								<td width="60">${num}</td>
								<td width="60">${money}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>			
			<!--支付明细报表-->
			<div class="rdbo" id="ltT2_4">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test17"></div>
					<div class="fltime">结束时间<input type="text" id="test18"></div>
					<div class="fltime">订单号<input type="text" id="txts3b2"></div>
					<div class="fltime"><input type="button" value="查询" onclick="ajaxS3B2()"></div>
				</div>
				<div class="showXm">
					<div class="formhead">
						支付明细报表
					</div>
					<div class="formtitle" id="S3B2">
						<table border="1px" bordercolor="#EFEFEF" cellspacing="0px">
			            	<tr bgcolor="#E9EDF1">
				        		<td width="70">订单号</td>
				        		<td width="60">支付金额</td>
				        		<td width="50">结账时间</td>
			            	</tr>
    		            <c:forEach items="${ZList}" var="zl">     
			            	<tr>
				       			<td width="70">${id}</td>
				            	<td width="60">${realpay}</td>
				        		<td width="60">${paytime}</td>
			           		</tr>
			            </c:forEach>
		                </table>
					</div>
				</div>
			</div>
			<!--餐台统计报表-->
			<div class="rdbo" id="ltT2_5">
				<div style="width: 1230px;height: 85px;float: left;">
					<div class="fltime">开始时间<input type="text" id="test19"></div>
					<div class="fltime">结束时间<input type="text" id="test20"></div>
					<div class="fltime">餐台名称
						<select id="s3b3Sel">
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
					<div class="fltime"><input type="button" value="查询" onclick="ajaxS3B3()"></div>
					<div class="showXm">
						<div class="formhead">
							餐台统计表
						</div>
						<div class="formtitle" id="S3B3">
							<table border="1px" bordercolor="#EFEFEF" cellspacing="0px">
								<tr bgcolor="#E9EDF1">
									<td width="60">餐台号</td>
									<td width="60">消费人数</td>
									<td width="60">消费金额</td>
								</tr>
    							<c:forEach items="${ZList}" var="zst">     
									<tr>
										<td width="60">${tablename}</td>
										<td width="60">${paymoney}</td>
										<td width="60">${paytime}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
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
					<div class="fltime">会员名/卡号<input type="text" id="v-name"></div>
					<div class="fltime">会员卡类型
						<select id="v-ctype">
							<option value="0">全部会员类型</option>
							<option value="普通会员">普卡会员</option>
							<option value="银卡会员">银卡会员</option>
							<option value="金卡会员">金卡会员</option>
						</select>
					</div>
					<div class="fltime"><input type="checkbox" id="v-co" name="v-co">仅显示有充值消费记录的会员卡</div>
					<div class="fltime"><input type="button" value="查询" id="v-tj"></div>
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						会员充值消费统计报表
					</div>
					<div class="formtitle" id="vtj-table">
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
					<div class="fltime">操作员<input type="text" id="v-doman"></div>
					<div class="fltime">会员卡类型
						<select name="1" id="viptname">
							<option value="0">全部会员类型</option>
							<option value="普通会员">普卡会员</option>
							<option value="银卡会员">银卡会员</option>
							<option value="金卡会员">金卡会员</option>
						</select>
					</div>
					<div class="fltime">消费类型
					<select id="v-xiaof">
					<option value="2">全部</option>
					<option value="0">充值</option>
					<option value="1">消费</option>
					</select>
					</div>
					<div class="fltime"><input type="button" value="查询" id="v-cj"></div>
					<!-- <div class="fltime"><input type="checkbox">消费</div> -->
				</div>
				</form>
				<div class="showXm">
					<div class="formhead">
						会员卡充值消费明细报表
					</div>
					<div class="formtitle" id="vip-mx">
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
<script type="text/javascript">
var vtime1;
var vtime2;
var vname;
var vctype;
var co;

$("#v-tj").click(function(){
	/* alert($("#test23").val().length); */
	if(($("#test23").val().length==0&&$("#test24").val().length!=0)||($("#test23").val().length!=0&&$("#test24").val().length==0)){
		alert("请明确时间区间");
	}else{
		vtime1=$("#test23").val();
	vtime2=$("#test24").val();
	vname=$("#v-name").val();
	vctype=$("#v-ctype").val();
	co=$('input:checkbox[name="v-co"]:checked').val();
	if(co==null){
	co="off";
	}else{
	co="on";
	}
/* 	 alert(time1+"--"+time2+"--"+vname+"--"+vctype+"--"+co); */
	$.ajax({
			url:"Vtj/ajaxSearch.do",
	  		dataType:"html",
	  		data:{
	  			"time1":vtime1,
	  			"time2":vtime2,
	  			"vname":vname,
	  			"vctype":vctype,
	  			"co":co
	  		},
	  		success:function(result){
	  			$("#vtj-table").html(result);
			}
		});
	}
});

$("#v-cj").click(function(){
	/* alert($("#test23").val().length); */
	if(($("#test25").val().length==0&&$("#test26").val().length!=0)||($("#test25").val().length!=0&&$("#test26").val().length==0)){
		alert("请明确时间区间");
	}else{
/* 	 alert(time1+"--"+time2+"--"+vname+"--"+vctype+"--"+co); */
	$.ajax({
			url:"Vtj/ajaxSearch2.do",
	  		dataType:"html",
	  		data:{
	  			"levelname":$("#viptname").val(),
				"doname":$("#v-doman").val(),
				"time1":$("#test25").val(),
				"time2":$("#test26").val(),
				"xiaofei":$("#v-xiaof").val()
	  		},
	  		success:function(result){
	  			$("#vip-mx").html(result);
			}
		});
	}
});

</script>

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
		$("#yyfx1").click(function(){ 
    	$("#test11").val("");
   		$("#test12").val("");
   		$("#s3b1Sel").val("0");		
     	$("#test17").val("");
    	$("#test18").val("");
    	$("#txts3b2").val("");
    	$("#test19").val("");
    	$("#test20").val("");
    	$("#s3b3Sel").val("0");
     })
     $("#yyfx2").click(function(){
     	$("#test11").val("");
   		$("#test12").val("");
   		$("#s3b1Sel").val("0");		
     	$("#test17").val("");
    	$("#test18").val("");
    	$("#txts3b2").val("");
    	$("#test19").val("");
    	$("#test20").val("");
    	$("#s3b3Sel").val("0");
     })
     $("#yyfx3").click(function(){
     	$("#test11").val("");
   		$("#test12").val("");
   		$("#s3b1Sel").val("0");		
     	$("#test17").val("");
    	$("#test18").val("");
    	$("#txts3b2").val("");
    	$("#test19").val("");
    	$("#test20").val("");
    	$("#s3b3Sel").val("0");
     })
</script>
<script>  
	 var s3b3Sel=$("#s3b3Sel").val();
	 var s3b1Sel=$("#s3b1Sel").val();
	 var txts3b2=$("#txts3b2").val();
	 var start11=$("#test11").val();
	 var end12=$("#test12").val();
	 var start17=$("#test17").val();
	 var end18=$("#test18").val();
	 var start19=$("#test19").val();
	 var end20=$("#test20").val();
	
     function ajaxS3B2(){
        var txts3b2=$("#txts3b2").val();
        var start17=$("#test17").val();
		var end18=$("#test18").val();
     	$.ajax({     	
     		type:"post",
     		url:"YingyeAction/findPayDetail.do",
     		data:{"txts3b2":txts3b2,"test17":start17,"test18":end18},
     		dataType:"html",
     		success:function(result){     		
     			$("#S3B2").html(result);
     		}
   	     });
     }
     function ajaxS3B1(){
    	var s3b1Sel=$("#s3b1Sel").val();
    	var start11=$("#test11").val();
   		var end12=$("#test12").val();
     	$.ajax({
     		type:"post",
     		url:"YingyeAction/findByCaipin.do",
     		data:{"s3b1Sel":s3b1Sel,"test11":start11,"test12":end12},
     		dataType:"html",
     		success:function(result){     	
     			$("#S3B1").html(result);
     		}
     	});
     }
    
     function ajaxS3B3(){
    	var s3b3Sel=$("#s3b3Sel").val();
    	var start19=$("#test19").val();
   		var end20=$("#test20").val();
     	$.ajax({
     		type:"post",
     		url:"YingyeAction/findTableDet.do",
     		data:{"s3b3Sel":s3b3Sel,"test19":start19,"test20":end20},
     		dataType:"html",
     		success:function(result){
     			$("#S3B3").html(result);
     		}
     	})
     }
     
</script>
<script>
  	function sendAjax()
  		{
	  		$.ajax({
	  			url:"baobiao/tot.do",
	  			dataType:"html",
	  			data:{"beginTime":beginTime},
	  			success:function(result){
	  				$("#showView").html(result);				
	  			}
  		});
  	}
  </script>
  <script>
  	$(".chaxunxd").click(function(){
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
  