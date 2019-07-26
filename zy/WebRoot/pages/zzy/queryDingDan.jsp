<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryDingDan.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="layui/css/layui.css" rel="stylesheet"  type="text/css" />
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="layui/layui.js"></script>
	<link href="css/zzy/TangShistyle.css" rel="stylesheet"  type="text/css" /> 
  </head>
  <script type="text/javascript">
   		$(function(){
		var danhao="";
  		var myDate = new Date();
		//获取当前年
		var year=myDate.getFullYear();
		//获取当前月
		var month=myDate.getMonth()+1;
		//获取当前日
		var date=myDate.getDate(); 
		var h=myDate.getHours();       //获取当前小时数(0-23)
		var m=myDate.getMinutes();     //获取当前分钟数(0-59)
		var s=myDate.getSeconds(); 
		danhao="D"+year+month+date+h+m+s;
		$("#danhao").html(danhao); 


		  	$("#hetai_title div").click(function(){
  			$(this).css('background','#88849A');
  			$(this).siblings().css('background','lightgoldenrodyellow');
  			$(this).css('color','white');
  			$(this).siblings().css('color','black');
  			 });
  			
  		$("#all1").click(function(){
  			htcantai=0;
  			sendHAjax();
  		});
  		$("#two1").click(function(){
  			htcantai=2;
  			sendHAjax();
  		});
  		$("#four1").click(function(){
  		
  			htcantai=4;
  			sendHAjax();
  		});
  		$("#six1").click(function(){
  			htcantai=6;
  			sendHAjax();
  		});
  		$("#eight1").click(function(){
  			htcantai=8;
  			sendHAjax();
  		});
  		$("#quan1").click(function(){
  			htarea=2;
  			sendHAjax();
  		});
  		$("#ting1").click(function(){
  			htarea=0;
  			sendHAjax();
  		});
  		$("#bao1").click(function(){
  			htarea=1;
  			sendHAjax();
  		});
  		$(".h").live('click',function(){
  		
		 htcantai=0;
		 htarea=2;
			sendHAjax();
		});	

 				

  	});	
/*   		$("#showcanhetai div").click(function(){
		 		if($(this).attr("id")!="slc"){
		 			$(this).css({"background":"#FF7900"}).attr("id","slc");
		 		}else{
		 			$(this).css({"background":"#F9D6B6"}).attr("id","");
		 		}
		 }); */
  </script>
  <body>
	<div style="height: 750pxpx;width: 100%;background-color: #d2d2d2;">
		<div style="height: 100px;width: 100%;border-bottom: 1px solid #eeeeee;float: left; background-color: white;">
			<div style="height: 15px;width: 100%;margin-top: 5px;font-weight: bold;">&nbsp;桌号：${dds.name }</div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;单号：
			<c:choose>
				<c:when test="${dds.state==1}">
					<label id="newdd">${dds.zlist.id }</label>
				</c:when>
				<c:otherwise>
					<label style="visibility: hidden;" id="danhao"></label>
				</c:otherwise>
			</c:choose>

			</div>
			<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;开台时间：${dds.zlist.ordertime}</div>
			<c:if test="${dds.hetai==2 }">
				<div style="height: 15px;width: 100%;margin-top: 5px;">&nbsp;主台桌号：${dds.futableid}</div>
			</c:if>
		</div>
		<div style="height: 420px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;background-color: white;">
			<table class="layui-table" lay-even lay-skin="row" >
				  <colgroup>
				    <col width="50%">
				    <col width="25%">
				    <col width="25%">
				  </colgroup>
		  		  <thead>
				    <tr>
				      <th>品名</th>
				      <th>数量</th>
				      <th>价格</th>
				    </tr> 
				  </thead>
				  <tbody>
 				  <c:forEach items="${DDXQ}" var="d">
				    <tr>
				      <td>${d.cainame}</td>
				      <td>${d.num}份</td>
				      <td>${d.money}</td>
				    </tr>
				   </c:forEach>  
				  </tbody>
			</table>
				
			</div>
			<div style="height: 35px;width: 100%;border-bottom: 1px solid #eeeeee;float: left;text-align: right;line-height: 35px;background-color: white;">
				菜品金额：${dds.zlist.paymoney }
			</div>
			<c:if test="${dds.state==0||dds.state==2}">
			<div class="add" style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_kaitai.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_diandan_n.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang_n.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai_n.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 5px;text-align: center;line-height: 48px;background-color: F6F8F9;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;">&#xe64c;</i> 合台</div>
			<div style="width: 125px;height: 48px;float: left;background-color: F6F8F9;;margin-top: 5px;text-align: center;line-height: 48px;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>
			</c:if>
			<c:if test="${dds.state==1}">
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_kaitai_n.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<a href="Tdiandan/showdiandan.do?listid=${dds.zlist.id}"><div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_diandan.jpg');margin-top: 5px;"></div></a>
			<c:if test="${dds.hetai==0}">
			
			
			<c:if test="${dds.zlist.paymoney==0}">
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang_n.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div class="deletezero" style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai.jpg');margin-top: 5px;"></div>
			</c:if>
			<c:if test="${dds.zlist.paymoney!=0}">
			<a href="Tdiandan/jiezhang.do?tid=${dds.zlist.id}"><div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div></a>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai_n.jpg');margin-top: 5px;"></div>
			</c:if>
			
			<div class="h" style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 5px;text-align: center;line-height: 48px;background-color: white;"><i class="layui-icon" style="color: 5A7B9E;">&#xe64c;</i> 合台</div>
			<div style="width: 125px;height: 48px;float: left;background-color: F6F8F9;;margin-top: 5px;text-align: center;line-height: 48px;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>
			</c:if>
			<c:if test="${dds.hetai==1}">
			
			<c:if test="${dds.zlist.paymoney==0}">
			<c:if test="${dds.htmoney==0}">
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang_n.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div>
			<div class="deletezero" style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai.jpg');margin-top: 5px;"></div>
			</c:if>
			<c:if test="${dds.htmoney!=0}">
			<a href="Tdiandan/jiezhang.do?tid=${dds.zlist.id}"><div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div></a>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai_n.jpg');margin-top: 5px;"></div>
			</c:if>
			</c:if>
			<c:if test="${dds.zlist.paymoney!=0}">
			<a href="Tdiandan/jiezhang.do?tid=${dds.zlist.id}"><div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div></a>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai_n.jpg');margin-top: 5px;"></div>
			</c:if>
			<div style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 5px;text-align: center;line-height: 48px;background-color: F6F8F9;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;">&#xe64c;</i> 合台</div>
			<div class="ct" style="width: 125px;height: 48px;float: left;background-color: white;;margin-top: 5px;text-align: center;line-height: 48px;"><i class="layui-icon" style="color: 58729C;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>	
			</c:if>
			<c:if test="${dds.hetai==2}">
			<a href="Tdiandan/jiezhang.do?tid=${dds.zlist.id}"><div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_jiezhang.jpg');margin-top: 5px;margin-left: 10px;margin-right: 5px;"></div></a>
			<div style="width: 125px;height: 48px;float: left;background-image: url('images/zzy/btn_qingtai_n.jpg');margin-top: 5px;"></div>
			<div style="width: 125px;height: 48px;float: left;margin-top: 5px;margin-left: 10px;margin-right: 5px;text-align: center;line-height: 48px;background-color: F6F8F9;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;">&#xe64c;</i> 合台</div>
			<div style="width: 125px;height: 48px;float: left;background-color: F6F8F9;;margin-top: 5px;text-align: center;line-height: 48px;color: #B5B4B8;"><i class="layui-icon" style="color: 979797;font-size: 20px;">&#xe64d;</i>&nbsp;拆台</div>				
			</c:if>
			</c:if>	
		</div>
<!-- 		<div id="addpaihao" style="display:none;width: 300px;height: 200px;background-color:lightgoldenrodyellow ;position: absolute;top: 200px;left: 500px;">
					<div style="background-color: #F5F5F5;width: 300px;height:36px ;">
				<div style="float: left;margin-left: 40px;">提醒</div>
				<div style="float: right;cursor: pointer;" class="cha"><img src="images/wh/w-cantai6.png"></div>	
			</div>
			<div style="margin-top: 50px;margin-left: 50px;">确定添加？</div>
			<div>
			<div style="margin-top: 30px;"> 
					<div id="s" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
					<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
			</div>
			</div>
		</div>	 -->
		
		<div id="kaitai" style="display:none;width: 400px;height: 300px;position: absolute;top: 200px;left: 300px;background: lightgoldenrodyellow;border-radius:15px 15px 15px 15px;">

			<div style="width:100%;height: 40px;background-color: #FFB800;float: left;line-height: 40px;color: lightgoldenrodyellow;font-size: 18px;cursor: default;font-weight: bold;">
				&nbsp;开台：${dds.name}<input type="hidden" id="tableid" value="${dds.id}"><input id="cashierid" type="hidden"  value="1" >
				<input type="hidden" id="ddcantai" value="${ddcantai}"><input id="ddstate" type="hidden"  value="${ddstate }" >
				<input type="hidden" id="ddarea" value="${ddarea}">
			</div>
			<div style="width: 100%;height: 260px;float: left;">
				<div style="width: 100%;height: 30px;float: left;margin-left: 100px;margin-top: 50px;">
					就餐人数：
					<input id="eatnum" name="eatnum" type="text" style="width: 60px;height:20px;text-align: center;">
					(座位数：<span id="maxsize">${dds.seatsize }</span>)
				</div>
				<div  style="width: 100%;height: 30px;float: left;margin-left: 100px;margin-top: 10px">
					服务员：
					<select id="fuwuid" name="fuwuid" style="width: 80px;">
						<c:forEach items="${fuwu}" var="f">
							<option value="${f.id}">${f.name}</option>
						</c:forEach>
					</select>
				</div>
			<div style="margin-top: 30px;float: left;margin-left: 50px;"> 
					<div id="kaitaiqueren" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
					<div class="quxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
			</div>
			</div>
		</div>
		<div id="qingtai" style="display:none;width: 400px;height: 300px;position: absolute;top: 200px;left: 300px;background: lightgoldenrodyellow;border-radius:15px 15px 15px 15px;">
			<div style="width:100%;height: 40px;background-color: #FFB800;float: left;line-height: 40px;color: lightgoldenrodyellow;font-size: 18px;cursor: default;font-weight: bold;">
				&nbsp;清台
			</div>
			<div style="width: 100%;height: 212px;float: left;text-align: center;line-height: 212px;">
				是否确定要清台？
			</div>
			<div style="width: 100%;height: 48px;float: left;margin-left: 50px;"> 
					<div id="qtquren" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
					<div class="qtquxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
			</div>
			
		</div>
		<div id="hetai" style="display:none;width:750px;height: 560px;position: absolute;top: 100px;left: 300px;background: lightgoldenrodyellow;border-radius:15px 15px 15px 15px;">
			<div style="width: 100%;height: 45px;background-color: #FFB800;float: left;line-height: 40px;color: lightgoldenrodyellow;font-size: 18px;cursor: default;font-weight: bold;border-radius:15px 15px 0px 0px;">
			 &nbsp;合并餐台
			</div>
		   	<div class="hetai_title" id="hetai_title">
				<div id="all1" style="background-color: #88849A;color: white;">全部</div>
				<div id="two1">二人桌</div>
				<div id="four1">四人桌</div>
				<div id="six1">六人桌</div>
				<div id="eight1" style="width:75px;float:left;cursor:pointer;height:40px;margin-left:20px;text-align: center;line-height: 40px;border-radius:5px 5px 5px 5px;">八人及以上</div>
			</div>
		   	<div class="hetai_title" id="hetai_title">
				<div id="quan1" style="background-color: #88849A;color: white;">全部</div>
				<div id="ting1">大厅</div>
				<div id="bao1">包厢</div>
			</div>
	
			<div id="showcanhetai" style="width:100%;height: 399px;float: left;">
				
			</div>
			<div style="width: 100%;height: 36px;float:left; ">
				<div id="htquxiao" style="width: 70px;height: 36px;float: right;margin-right: 20px;background-image: url('images/zzy/htquxiao.jpg');cursor: pointer;"></div>			
				<div id="htqueren" style="width: 70px;height: 36px;float: right;margin-right: 20px;background-image: url('images/zzy/htqueren.jpg');cursor: pointer;"></div>

			</div>
		</div>
		<div id="chaitai" style="display:none;width: 400px;height: 300px;position: absolute;top: 200px;left: 300px;background: lightgoldenrodyellow;border-radius:15px 15px 15px 15px;">
			<div style="width:100%;height: 40px;background-color: #FFB800;float: left;line-height: 40px;color: lightgoldenrodyellow;font-size: 18px;cursor: default;font-weight: bold;">
				&nbsp;拆台
			</div>
			<div style="width: 100%;height: 212px;float: left;text-align: center;line-height: 212px;">
				是否确定要拆台？
			</div>
			<div style="width: 100%;height: 48px;float: left;margin-left: 50px;"> 
					<div id="ctqueren" class="trust" style="float: left;margin-left:40px;cursor: pointer;"><img src="images/wh/w-queding.png"></div>
					<div class="ctquxiao" style="float: left;margin-left: 50px;cursor: pointer;"><img src="images/wh/w-quxiao.png"></div>
			</div>
			
		</div>
  </body>
  <script type="text/javascript">
		$(".add").click(function(){
			//$("#kaitai").find("input").val("");
			$("#kaitai").css("display","block");	
			$("#qingtai").css("display","none");
			$("#chaitai").css("display","none");
		});
		$(".deletezero").click(function(){
			//$("#kaitai").find("input").val("");
			$("#kaitai").css("display","none");	
			$("#qingtai").css("display","block");
			$("#chaitai").css("display","none");
		});	
		$(".ct").click(function(){
			//$("#kaitai").find("input").val("");
			$("#kaitai").css("display","none");	
			$("#qingtai").css("display","none");
			$("#chaitai").css("display","block");
		});		
		$(".quxiao").click(function(){
			$(this).parent().parent().parent().css("display","none");
		});
		$(".qtquxiao").click(function(){
			$(this).parent().parent().css("display","none");
		});
		$(".ctquxiao").click(function(){
			$(this).parent().parent().css("display","none");
		});
		$("#htquxiao").click(function(){
			$(this).parent().parent().css("display","none");
		});		


		var text = document.getElementById("eatnum");
		var maxsize = document.getElementById("maxsize");

		text.onkeyup = function(){
		this.value=this.value.replace(/\D/g,'');
		if(text.value>maxsize.innerText){
		  text.value = maxsize.innerText;
		}
		}; 


  </script>
</html>
