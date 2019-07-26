<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ztableAjax.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.js" ></script>
  </head>
  
  <body>
    <table class="ddd" cellpadding="0" cellspacing="0" >
		<c:forEach items="${oc }" var="oc">
		<tr height="30" style="background:#DBE4ED;">
			<td style="text-align: center;" width="140" >${oc.id }</td>
			<td style="text-align: center;" width="90" >${oc.ckname }</td>
			<td style="text-align: center;" width="90" >${oc.doname }</td>
			<td style="text-align: center;" width="180" >${oc.outtime }</td>
			<td>${oc.info }</td>
		</tr>
		</c:forEach>
	</table>
	
	<div id="pages">
					<input type="button" value="首页" id="pagetop" />
					<input type="button" value="上一页" id="pagebefor"/>
					<!--循环出页数-->
					<c:forEach begin="1" end="${zy }" var="i">
					<input type="button" value="${i }" class="pagenum"/>
					</c:forEach>
					<!---->
					<input type="button" value="下一页" id="pageafter"/>
					<input type="button" value="末页" id="pagedown"/>
				</div>
	
	
  </body>
  <script type="text/javascript">
  	$("#rbody3 .ddd tr").css("background","#FFFFFF");
	$("#rbody3 .ddd tr").eq(0).css("background","#DBE4ED");
	var cid=$("#rbody3 .ddd tr").eq(0).find(".cid").text();
	$("#rbody3 .ddd tr").click(function(){
	$(this).css("background","#DBE4ED");
	$(this).siblings().css("background","#FFFFFF");
	cid=$(this).find(".cid").text();
	});
  
  
  $("#rbody3 .ddd tr").dblclick(function(){
	/* alert($(this).find("td").eq(0).text())
	$(this).find("td").eq(0).text(); */
		/* 	alert(page) */
		$("#rbody3 #out-shuangji").css("display","block");
		$.ajax({
			url:"outCangku/tankuang.do",
	  		dataType:"html",
	  		data:{
	  		"id":$(this).find("td").eq(0).text()
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-shuangji").html(result);
			}
		});
	 });
  
  
  $("#rbody3 #pages").css("margin-top","10px");
	$("#rbody3 #pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#rbody3 #pages input").eq("${page+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody3 #pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#rbody3 #pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
		/* alert(1); */
			$("#rbody3 #pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(0).attr("disabled","disabled");
			$("#rbody3 #pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody3 #pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(0).removeAttr("disabled");
			$("#rbody3 #pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").removeAttr("disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#rbody3 #pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#rbody3 #pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody3 #pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		$("#rbody3 #pages input").click(function(){
		
			var page;
				if($(this).val()=="首页"){
					page=1;
				}else if($(this).val()=="末页"){
					page="${zy}";
				}else if($(this).val()=="上一页"){
					page="${page-1}";
				}else if($(this).val()=="下一页"){
					page="${page+1}";
				}else{
					page=$(this).val();
				}
			/* 	alert(page) */
		$.ajax({
			url:"outCangku/addCangkucun.do",
	  		dataType:"html",
	  		data:{
	  			"id":id,
	  			"cangkuid":cangkuid,
	  			"outtime":outtime,
	  			"doman":doman,
	  			"info":info,
	  			"page":page
	  		},
	  		success:function(result){
	  			$("#rbody3 #out-zhut").html(result);
			}
		});
	});
	
	
  </script>
</html>
