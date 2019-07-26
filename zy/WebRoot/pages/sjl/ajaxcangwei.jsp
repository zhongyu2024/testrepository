<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ajaxcangwei.jsp' starting page</title>
    
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
    <table cellpadding="0" cellspacing="0" >
					<tr height="30">
						<td style="background: #354148;color: #B6BBC3;" width="20"></td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="80" >编码</td>
						<td style="background: #354148;color: #B6BBC3;text-align: center;" width="220">名称</td>
						<td style="background: #354148;color: #B6BBC3;">&nbsp;&nbsp;备注</td>
					</tr>
				</table>
				<input type="hidden" id="ck-page" value="${page }"/>
				<table class="ddd" cellpadding="0" cellspacing="0" >
					<c:forEach items="${cktable }" var="ckt">
					<tr>
						<td style="text-align: center;" width="20" ><a>▶</a></td>
						<td style="text-align: center;" width="80" class="cid">${ckt.id}</td>
						<td style="text-align: center;"  width="220" class="cname">${ckt.name } </td>
						<td class="cinfo">${ckt.info }</td>
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
  <script>
    $(".ddd tr").eq(0).css("background","#DBE4ED");
	$(".ddd tr").eq(0).find("a").css("display","block");
	var cid=$(".ddd tr").eq(0).find(".cid").text();
	indexss=$(this).index();
	$(".ddd tr").click(function(){
		$(this).css("background","#DBE4ED");
		$(this).find("a").css("display","block");
		$(this).siblings().css("background","none");
		$(this).siblings().find("a").css("display","none");
		cid=$(this).find(".cid").text();
		
	});
	$("#pages").css("margin-top","15px");
	$("#pages input").css({"padding-left":"5px","padding-right":"5px"});
		if("${zy }"!=0){
			$("#pages input").eq("${page+1}").css({"background":"#00BC9B","color":"#ffffff"});
			$("#pages input").eq("${page+1}").attr("disabled","disabled");
			}
		$("#pages input").mouseenter(function(){
				$(this).css({"background":"#00BC9B","color":"white"});
			}).mouseleave(function(){
				if($(this).index()!="${page+1}")
				$(this).css({"background":"white","color":"#000000"});
			});
		
		if("${page}"==1){
			$("#pages input").eq(0).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#pages input").eq(0).attr("disabled","disabled");
			$("#pages input").eq(1).css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#pages input").eq(1).attr("disabled","disabled");
		}else{
			$("#pages input").eq(0).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq(0).removeAttr("disabled");
			$("#pages input").eq(1).css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq(1).removeAttr("disabled");
		}
		if("${page}"=="${zy }"){
			$("#pages input").eq("${zy+2}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#pages input").eq("${zy+3}").css({"background":"white","color":"#8D90A8","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+3}").attr("disabled","disabled");
		}else{
			$("#pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+2}").removeAttr("disabled");
			$("#pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+3}").removeAttr("disabled");
		}
		if("${zy }"==0){
			$("#pages input").eq("${zy+2}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+2}").attr("disabled","disabled");
			$("#pages input").eq("${zy+3}").css({"background":"white","color":"#000000","border-color":"#e0e0e0" });
			$("#pages input").eq("${zy+3}").attr("disabled","disabled");
		}
		
		$("#pages input").click(function(){
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
				/* alert(page);
				 */
				$.ajax({
					url:"Cangku/pageById.do",
					dataType:"html",
					data:{"page":page},
					success:function(result){
					$("#rbody1 #rtitle").html(result);
				}
				});
					
			});
  </script>
</html>
