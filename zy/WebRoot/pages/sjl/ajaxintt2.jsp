<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxintt2.jsp' starting page</title>
    
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
    <table cellspacing="0" cellpadding="0" style="width: 500px;">
		<tr>
			<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">编号</td>
			<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;" width="140">名称</td>
			<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">类型</td>
			<td style="background: #354148;color: #B6BBBF;text-align: center;font-size: 15px;">单位</td>
		</tr>
		<c:forEach items="${cailiao }" var="cl">
		<tr class="ccl" style="background:#E8E8E8">
			<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="hwid">${cl.id }</td>
			<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" width="140" class="hwname">${cl.name }</td>
			<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;">${cl.mtypename }</td>
			<td style="border-bottom: 0.5px solid #B6BBBF;border-right: 0.5px solid #B6BBBF;text-align: center;font-size: 14px;" class="dw">${cl.unitname }</td>
		</tr>
		</c:forEach>
	</table>
	<div id="cl-pages">
		<input type="button" value="首页"  />
		<input type="button" value="上一页" />
			<!--循环出页数-->
		<c:forEach begin="1" end="${zy1 }" var="i">
		<input type="button" value="${i }" />
		</c:forEach>
			<!---->
		<input type="button" value="下一页" />
		<input type="button" value="末页" />
	</div>
  </body>
  <script type="text/javascript">
  	var hwname=$(".ccl").eq(0).find(".hwname").text();
	var hwid=$(".ccl").eq(0).find(".hwid").text();
	var hwdw=$(".ccl").eq(0).find(".dw").text();
  	$(".ccl").css("background","#DBE4ED");
	$(".ccl").eq(0).css("background","#E8E8E8");
	$(".ccl").click(function(){
	$(this).css("background","#E8E8E8");
	$(this).siblings().css("background","none");
	hwname=$(this).find(".hwname").text();
	hwid=$(this).find(".hwid").text();
	hwdw=$(this).find(".dw").text();
	/* alert(hwid+"---"+hwname); */
	});
	
	
	$("#rbody2 #cl-pages").css("margin-top","10px");
	$("#rbody2 #cl-pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy1 }"!=0){
			$("#rbody2 #cl-pages input").eq("${page1+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#rbody2 #cl-pages input").eq("${page1+1}").attr("disabled","disabled");
			}
		$("#rbody2 #cl-pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page1+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
	if("${page1}"==1){
		/* alert(1); */
			$("#rbody2 #cl-pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq(0).attr("disabled","disabled");
			$("#rbody2 #cl-pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#rbody2 #cl-pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq(0).removeAttr("disabled");
			$("#rbody2 #cl-pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq(1).removeAttr("disabled");
		}
		if("${page1}"=="${zy1 }"){
			$("#rbody2 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+2}").attr("disabled","disabled");
			$("#rbody2 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+3}").attr("disabled","disabled");
		}else{
			$("#rbody2 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+2}").removeAttr("disabled");
			$("#rbody2 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+3}").removeAttr("disabled");
		}
		if("${zy1 }"==0){
			$("#rbody2 #cl-pages input").eq("${zy1+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+2}").attr("disabled","disabled");
			$("#rbody2 #cl-pages input").eq("${zy1+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#rbody2 #cl-pages input").eq("${zy1+3}").attr("disabled","disabled");
		}
		$("#rbody2 #cl-pages input").click(function(){
		
			var page;
				if($(this).val()=="首页"){
					page=1;
				}else if($(this).val()=="末页"){
					page="${zy1}";
				}else if($(this).val()=="上一页"){
					page="${page1-1}";
				}else if($(this).val()=="下一页"){
					page="${page1+1}";
				}else{
					page=$(this).val();
				}
			/* 	alert(page) */
		$.ajax({
			url:"Incangku/cailiaoSearch.do",
	  		dataType:"html",
	  		data:{"type":$("#rbody2 .type").val(),
	  		"text":$("#rbody2 .text").val().trim(),
	  		"page":page
	  		},
	  		success:function(result){
	  			$("#rbody2 #chtable1").html(result);
			}
		});
	});
	
	
	
	
	
	
	
	
	
	
  </script>
</html>
