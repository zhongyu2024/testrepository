<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jiezhang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/xfr/jiezhang.css">
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

  </head>
  
  <body>
   <div id="jbox"> 
   
   <form action="Kuaican/subjiezhang.do" methos="post" id="frm">
   		<!-- 标记是什么页面跳转过来的 -->
   		<input id="ttss" type="hidden" name="tts" value="${types }" >
	   	<div id="jtop">&nbsp; 
	   		<img alt="" src="images/xfr/13.jpg" >
			<img alt="" src="images/xfr/16.jpg" >   		   		
	   	</div>
	   	<div id="jleft" >
	   		<div>单号：<label>${zlist.id }</label><input type="hidden" value="${zlist.id }" name="id"></div>
	   		<div>取餐牌号/餐位号：<label>${zlist.tableid }</label><input type="hidden" name="tableid" value="${zlist.tableid }"></div>
	   		<div>消费人数：<label>${zlist.eatnum }</label></div>   		
	   		<div>消费时间：<label>${zlist.ordertime }</label></div> 
	   		<hr width="95%" size="1px">  		 		
	   		<div class="list" >
	   			<div class="m1l1" style="font-size: 16px;color: red">
	   				<div class="in" style="width:50%">菜名</div>
	   				<div class="in" style="width:25%">数量</div>
	   				<div class="in" style="width:25%">总金额</div>
	   			</div>
	   		</div>
	   		<c:forEach items="${cailist }" var="cai">
	   		 <div class="list">
	   			<div class="m1l1">
	   				<div class="in" style="width:50%"><img src="images/xfr/8.jpg">${cai.cainame }</div>
	   				<div class="in" style="width:25%"><label class="num">${cai.num }</label>*份</div>
	   				<div class="in" style="width:25%"><label class="pay">${cai.money }0</label></div>
	   			</div>
	   			<div class="beizhu1">${cai.info }</div>
	   		</div> 
	   		</c:forEach>
	   		 		
	   	</div>
	   	<div id="jright">
	   		<div id="jr1">
	   			<div style="height:50px;border-bottom: 1px solid #CCCCCC;">
	   				&nbsp;&nbsp;&nbsp;&nbsp;消费金额：&nbsp;&nbsp;&nbsp;&nbsp;<label id="shouldpay">${zlist.paymoney }</label>
	   			</div>
	   			<div style="height:70px;border-bottom: 1px solid #CCCCCC;"> 
	   				&nbsp;&nbsp;&nbsp;&nbsp;折扣金额：&nbsp;&nbsp;&nbsp;&nbsp;<label id="countmoney"></label><input type="hidden" name="dazhemoney" value="0">
	   			</div>
	   			<div style="height:90px">
	   				&nbsp;&nbsp;&nbsp;&nbsp;应付金额：&nbsp;&nbsp;&nbsp;&nbsp;<label id="realpay">${zlist.paymoney }</label><input type="hidden" name="realpay" value="${zlist.paymoney }">
	   			</div>
	   		</div>
	   		<div id="jr2">
	   			<div style="margin-top: 10px;margin-bottom: 10px;" >
	   				&nbsp;&nbsp;&nbsp;&nbsp;<label>会员：<input id="vip" type="text" style="width:170px;height:30px"placeholder="请输入手机号">&nbsp;&nbsp;<label style="color:red;font-size: 12px;"></label></label>
	   				
	   			</div>
	   			<div style=" margin-bottom10px; padding-top: 5px;display: none;" id="vinfo">
	   				<div>会员名：<label id="vname"></label><input type="hidden" name="vip" value="0"></div>
	   				<div>会员级别：<label id="level"></label></div>   
	   				<div>享受折扣：<label id="count"></label></div>
	   				<div>余额：<label id="yue"></label>&nbsp;&nbsp;<label style="color:red;"></label></div>
	   				<div><label style="font-size:12px;color:red;">温馨提示：当会员账户余额足够结账时，会优先以账户余额付款，否则不能使用会员账户支付，且不能享受会员优惠！</label></div>				
	   			</div>
	   		</div>
	   		<div style="margin-top: 30px;" align="center">
	   			<input id="jiezhang1" type="button" value="结账">
	   		</div>
	   	</div>
   	</form>
   </div>
  </body>
  <script type="text/javascript">
  //var isvip=false;//标记是否是会员支付
  	$(function(){
  		$("#vip").blur(function(){  		
  			var tel=$("#vip").val();
  			if(isNaN(parseInt(tel))||tel.length!=11){
  				alert("格式错误！");
  			}else{
  				var shouldpay=$("#shouldpay").html();//获取消费金额
  				$.ajax({
  					method:"post",
  					dataType:"JSON",
  					url:"Kuaican/getvip.do",
  					data:{"tel":tel},
  					success:function(result){
  						if(result[0]!=null){
  							$("#vinfo").css("display","block");
  							$("#vname").html(result[0].name);
  							$("#vname").next().val(result[0].id);
  							$("#level").html(result[0].v_levelname);
  							$("#count").html(result[0].v_count);
  							$("#yue").html(result[0].money);  							
  							if(parseInt(result[0].money)>=parseInt(shouldpay)){ 
  								//isvip=true;	//会员支付							
	  							$("#countmoney").html((parseInt(shouldpay)*(1-result[0].v_count)).toFixed(2));
	  							$("#countmoney").next().val((parseInt(shouldpay)*(1-result[0].v_count)).toFixed(2));
	  							//给隐藏字段赋值
	  							$("#realpay").html(parseInt(shouldpay)-$("#countmoney").html());
	  							$("#realpay").next().val(parseInt(shouldpay)-$("#countmoney").html());
  							}else{
  								$("#yue").next().html("余额不足！");
  							}
  						}else{
  							$("#vip").next().html("未找到相关会员信息！");
  							$("#vip").val("");
  						}
  					}
  				});
  			}
  		});
  		//当获取焦点时清空页面上的会员信息
  		$("#vip").focus(function(){
  			//isvip=false;
  			$("#vinfo").css("display","none");
		 	$("#countmoney").html("");
		 	$("#yue").next().html("");
		  	$("#realpay").html($("#shouldpay").html());
		  	$("#vip").next().html("");
  		});
  		//结账
  		$("#jiezhang1").click(function(){
  			if($("#ttss").val()=="waimai"||$("#ttss").val()=="waimaiquhui"){
  				$("#frm").attr("action","Waimai/subjiezhang.do");
  			}else if($("#ttss").val()=="tangshi"){
  				$("#frm").attr("action","Tdiandan/subjiezhang.do");
  			}
  			 $("#frm").submit();	
  		});
  	});
  </script>
</html>
